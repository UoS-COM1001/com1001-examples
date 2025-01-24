RSpec.describe "Login App" do
  describe "GET /" do
    context "when not logged in" do
      it "asks the user to log in" do
        get "/"
        # equivalent to: expect(last_response.status).to be(302)
        expect(last_response).to be_redirect
        expect(last_response.location).to end_with("/login")
      end
    end

    context "when logged in" do
      it "displays the welcome message" do
        get "/", {}, { "rack.session" => { logged_in: true } }
        expect(last_response).to be_ok
        expect(last_response.body).to include("Welcome to the Secure Area")
      end
    end
  end

  describe "GET /login" do
    it "asks the user to login" do
      get "/login"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Login")
    end
  end

  describe "POST /login" do
    context "with no login details" do
      it "tells the user the details are incorrect" do
        post "/login"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Username/Password combination incorrect")
      end
    end

    context "with incorrect login details" do
      it "tells the user the details are incorrect" do
        post "/login", "username" => "wrong_user", "password" => "wrong_password"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Username/Password combination incorrect")
      end
    end

    context "with correct login details" do
      it "redirects to the secure area page" do
        post "/login", "username" => "user", "password" => "pass"
        expect(last_response).to be_redirect
        expect(last_response.location).to end_with("/")
      end
    end
  end

  describe "GET /logout" do
    it "says the user is logged out" do
      get "/logout"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Logged out")
    end
  end
end
