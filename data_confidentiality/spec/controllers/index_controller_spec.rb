RSpec.describe "index controller" do
  describe "GET /" do
    context "when not logged in" do
      it "says you're not logged in" do
        get "/"
        expect(last_response).to be_ok
        expect(last_response.body).to include("You are not logged in")
      end
    end

    context "when logged in" do
      it "says you're logged in" do
        get "/", {}, { "rack.session" => { logged_in: true, username: "phil" } }
        expect(last_response).to be_ok
        expect(last_response.body).to include("Your username is phil")
      end
    end
  end
end
