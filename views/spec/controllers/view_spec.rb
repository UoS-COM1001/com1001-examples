RSpec.describe "view example" do
  describe "GET /" do
    it "has a status code of 200 (OK) and displays the view" do
      get "/"
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Simple View Example")
    end
  end
end
