RSpec.describe "Adding a player" do
  context "when a new player is added" do
    it "then shows the player on the search page" do
      # add the player
      visit "/add"
      fill_in "first_name", with: "George"
      fill_in "surname", with: "Test"
      fill_in "gender", with: "M"
      fill_in "club", with: "Mantester Utd"
      fill_in "country", with: "Northern RSpec"
      fill_in "position", with: "Midfield"
      fill_in "date_of_birth", with: "1946-05-22"
      click_on "Submit"

      # check the player is listed on the search page
      expect(page).to have_content "George Test"
    end
  end
end
