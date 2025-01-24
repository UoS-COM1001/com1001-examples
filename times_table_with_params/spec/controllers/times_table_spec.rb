RSpec.describe "times table with params example" do
  describe "GET /times-table" do
    context "when no parameters are supplied" do
      it "has a status code of 200 (OK) and complains" do
        get "/times-table"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("Invalid parameters")
      end
    end

    context "when valid parameters are supplied" do
      it "has a status code of 200 (OK) and displays the times table" do
        get "/times-table", "m" => "5", "l" => "4"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("4 times 5 = 20")
      end
    end

    context "when invalid parameters are supplied" do
      it "has a status code of 200 (OK) and complains" do
        get "/times-table", "m" => "abc", "l" => "def"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("Invalid parameters")
      end
    end

    context "when no m parameter is supplied (only l)" do
      it "has a status code of 200 (OK) and complains" do
        get "/times-table", "l" => "4"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("Invalid parameters")
      end
    end

    context "when no l parameter is supplied (only m)" do
      it "has a status code of 200 (OK) and complains" do
        get "/times-table", "m" => "4"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("Invalid parameters")
      end
    end
  end
end
