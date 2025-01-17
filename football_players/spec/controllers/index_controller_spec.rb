RSpec.describe "index controller" do
  describe "GET /" do
    it "displays the players in the database" do
      add_test_player_to_db("Jarrod", "Bowen")
      add_test_player_to_db("George", "Baldock")
      get "/"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Jarrod Bowen")
      expect(last_response.body).to include("George Baldock")
    end

    it "searches the players in the database" do
      add_test_player_to_db("Jarrod", "Bowen", "M", "West Ham United")
      add_test_player_to_db("George", "Baldock", "M", "Sheffield United")
      get "/", "club_search" => "West Ham United"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Jarrod Bowen")
      expect(last_response.body).not_to include("George Baldock")
    end
  end
end
