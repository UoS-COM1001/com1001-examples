RSpec.describe Customer do
  describe "#signup" do
    it "encrypts the customer's secret data" do
      customer = described_class.new

      customer.signup(
        "username" => "fred", "data" => "fred's secret", "password" => "pass"
      )

      expect(customer.username).to eq("fred")
      expect(customer.data_crypt).not_to eq("fred's secret")
      expect(customer.errors).to be_empty
    end
  end

  describe "#login" do
    it "decrypts the customer's secret data" do
      customer = described_class.new

      customer.signup(
        "username" => "bob", "data" => "bob's secret", "password" => "pass"
      )

      data = customer.login("password" => "pass")

      expect(data).to eq("bob's secret")
    end
  end
end
