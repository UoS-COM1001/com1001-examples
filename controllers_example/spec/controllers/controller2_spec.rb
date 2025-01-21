RSpec.describe "controller2" do
  describe "GET /route3" do
    it "has a status code of 200 (OK)" do
      get "/route3"
      expect(last_response.status).to eq(200)
    end
  end
end
