RSpec.describe "Validation and Sanitisation Example" do
  describe "GET /" do
    context "when no data is submitted" do
      it "simply displays the form" do
        get "/"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("Please enter your personal information")
      end
    end

    context "when data is submitted and it is all valid" do
      it "says 'Success'" do
        get "/", "first_name" => "Joe", "surname" => "Bloggs", "age" => "20", "email_address" => "joe@bloggs.com"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("Success")
      end
    end

    context "when only partial data is submitted" do
      it "says there are errors" do
        get "/", "age" => "20"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("errors")
      end
    end

    context "when the submitted data is invalid" do
      it "says there are errors" do
        get "/", "first_name" => "", "surname" => "", "age" => "xyz", "email_address" => "xyz"
        expect(last_response.status).to eq(200)
        expect(last_response.body).to include("errors")
      end
    end
  end
end
