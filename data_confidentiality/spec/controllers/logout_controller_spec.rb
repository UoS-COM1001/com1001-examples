RSpec.describe "logout controller" do
  describe "GET /logout" do
    it "redirects" do
      get "/logout"
      expect(last_response).to be_redirect
      expect(last_response.location).to end_with("/")
    end
  end
end
