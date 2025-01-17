RSpec.describe "Editing a player" do
  context "given a player has been added" do
    context "when that player is edited" do
      it "then shows the updated player on the search page" do
        # add the initial player
        visit "/add"
        fill_in "first_name", with: "George"
        fill_in "surname", with: "Test"
        fill_in "gender", with: "M"
        fill_in "club", with: "Mantester Utd"
        fill_in "country", with: "Northern RSpec"
        fill_in "position", with: "Midfield"
        fill_in "date_of_birth", with: "1946-05-22"
        click_on "Submit"

        # edit the initial player
        visit "/edit?id=1"
        fill_in "first_name", with: "Zinedine"
        click_on "Submit"

        # check the player is in the list
        expect(page).to have_content "Zinedine Test"
      end
    end
  end
end
