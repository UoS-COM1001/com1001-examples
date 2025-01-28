RSpec.describe "signup controller" do
  describe "GET /signup" do
    it "displays a blank form" do
      get "/signup"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Please enter your details")
    end
  end

  describe "POST /signup" do
    it "signs up a user successfully" do
      post "/signup", "username" => "phil", "data" => "secret", "password" => "password"
      expect(last_response).to be_redirect
      expect(last_response.location).to end_with("/")
    end

    it "does not re-signup an existing user" do
      customer = Customer.new
      customer.signup({ "username" => "phil", "data" => "secret", "password" => "password" })
      customer.save
      post "/signup", "username" => "phil", "data" => "secret", "password" => "password"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Username already taken")
    end

    it "does not accept a blank form entries" do
      post "/signup"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Username cannot be empty")
      expect(last_response.body).to include("Secret data cannot be empty")
      expect(last_response.body).to include("Password cannot be empty")
    end
  end
end
