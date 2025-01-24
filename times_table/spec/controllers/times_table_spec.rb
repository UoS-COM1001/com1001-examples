RSpec.describe "times table example" do
  describe "GET /times-table" do
    it "has a status code of 200 (OK) and displays the times table" do
      get "/times-table"
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("10 times 8 = 80")
    end
  end
end
