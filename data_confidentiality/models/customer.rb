# Model class for customers
class Customer < Sequel::Model
  def signup(params)
    username = params.fetch("username", "").strip
    errors.add("username", "cannot be empty") if username.empty?

    errors.add("username", "already taken") unless Customer.first(username: username).nil?

    data = params.fetch("data", "").strip
    errors.add("data", "cannot be empty") if data.empty?

    password = params.fetch("password", "").strip
    errors.add("password", "cannot be empty") if password.empty?

    return false unless errors.empty?

    self.username = username

    # Set up AES for encryption.
    aes = OpenSSL::Cipher.new('AES-128-CBC').encrypt

    # Generate a random IV.
    self.iv = Sequel.blob(aes.random_iv)

    # Generate a random salt.
    self.salt = Sequel.blob(OpenSSL::Random.random_bytes(16))

    # Get the key from the password and salt.
    aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, 20_000, 16)

    # Encrypt the data
    self.data_crypt = Sequel.blob(aes.update(data) + aes.final)

    true
  end

  def login(params)
    password = params.fetch("password", "").strip

    # Set up AES for decryption.
    aes = OpenSSL::Cipher.new('AES-128-CBC').decrypt

    # Set the IV.
    aes.iv = iv

    # Get the key from the password and salt.
    aes.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, 20_000, 16)

    # Try to decrypt the data.
    begin
      aes.update(data_crypt) + aes.final
    rescue OpenSSL::Cipher::CipherError
      nil
    end
  end
end
