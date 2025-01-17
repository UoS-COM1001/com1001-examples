RSpec.describe "main controller file" do
  describe "GET /" do
    it "has a status code of 200 (OK)" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end
end
