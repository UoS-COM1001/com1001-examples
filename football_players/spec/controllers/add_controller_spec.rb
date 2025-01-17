RSpec.describe "add controller" do
  describe "GET /add" do
    it "displays a blank form" do
      get "/add"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Add Player")
    end
  end

  describe "POST /add" do
    context "when the parameters are valid" do
      it "adds the player" do
        post "/add", "first_name" => "Bukayo", "surname" => "Saka", "gender" => "M", "club" => "Arsenal",
                     "country" => "England", "position" => "Midfield", "date_of_birth" => "2001-09-05"
        player = Player.first
        expect(player).not_to be_nil # check the record has been added
        expect(player.first_name).to eq("Bukayo")
      end

      it "redirects to /" do
        post "/add", "first_name" => "Bukayo", "surname" => "Saka", "gender" => "M", "club" => "Arsenal",
                     "country" => "England", "position" => "Midfield", "date_of_birth" => "2001-09-05"
        expect(last_response).to be_redirect
        expect(last_response.location).to end_with("/")
      end
    end

    context "when the parameters are invalid" do
      it "says to correct the errors" do
        post "/add"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Please correct the errors below")
      end
    end
  end
end
