RSpec.describe "edit controller" do
  describe "GET /edit" do
    context "when the id is valid" do
      it "displays the form to edit the player" do
        player = add_test_player_to_db("Erling", "Haaland")
        get "edit", "id" => player.id
        expect(last_response).to be_ok
        expect(last_response.body).to include("Erling")
        expect(last_response.body).to include("Haaland")
      end
    end

    context "when the id is invalid" do
      it "says unknown player" do
        get "edit"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Unknown player")
      end
    end
  end

  describe "POST /edit" do
    context "when the parameters are valid" do
      it "changes the player in the database" do
        player = add_test_player_to_db("Bukayo", "Saka", "M", "Arsenal", "England", "Midfield", "2001-09-05")
        post "/edit", "id" => player.id, "first_name" => "Bukayo", "surname" => "Saka",
                      "gender" => "M", "club" => "Everton", "country" => "England",
                      "position" => "Midfield", "date_of_birth" => "2001-09-05"
        edited_player = Player.first(id: player.id)
        expect(edited_player.club).to eq("Everton")
      end

      it "redirects to /" do
        player = add_test_player_to_db("Bukayo", "Saka", "M", "Arsenal", "England", "Midfield", "2001-09-05")
        post "/edit", "id" => player.id, "first_name" => "Bukayo", "surname" => "Saka",
                      "gender" => "M", "club" => "Everton", "country" => "England",
                      "position" => "Midfield", "date_of_birth" => "2001-09-05"
        expect(last_response).to be_redirect
        expect(last_response.location).to end_with("/")
      end
    end

    context "when the parameters are invalid" do
      it "doesn't change the player in the database" do
        player = add_test_player_to_db("Bukayo", "Saka", "M", "Arsenal", "England", "Midfield", "2001-09-05")
        post "/edit", "id" => player.id, "first_name" => "Bob"
        expect(player.first_name).to eq("Bukayo")
      end

      it "says to correct the errors" do
        player = add_test_player_to_db("Bukayo", "Saka", "M", "Arsenal", "England", "Midfield", "2001-09-05")
        post "/edit", "id" => player.id
        expect(last_response).to be_ok
        expect(last_response.body).to include("Please correct the errors below")
      end
    end
  end
end
