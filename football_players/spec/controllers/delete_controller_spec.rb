RSpec.describe "delete controller" do
  describe "POST /delete" do
    context "when the id passed does not correspond to a player in the database" do
      it "does complains with an error" do
        post "/delete", "id" => "1"
        expect(last_response.body).to include("Unknown player")
      end
    end

    context "when the id passed corresponds to a player in the database" do
      it "deletes the player" do
        player = add_test_player_to_db
        post "/delete", "id" => player.id
        expect(Player.first(id: player.id)).to be_nil
      end

      it "redirects to /" do
        player = add_test_player_to_db
        post "/delete", "id" => player.id
        expect(last_response).to be_redirect
        expect(last_response.location).to end_with("/")
      end
    end
  end
end
