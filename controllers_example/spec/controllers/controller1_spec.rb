RSpec.describe "controller1" do
  describe "GET /route1" do
    it "has a status code of 200 (OK)" do
      get "/route1"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /route2" do
    it "has a status code of 200 (OK)" do
      get "/route2"
      expect(last_response.status).to eq(200)
    end
  end
end
