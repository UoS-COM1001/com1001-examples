RSpec.describe "Deleting a player" do
  context "given a player has been added" do
    context "when that player is deleted" do
      it "then the player is not shown on the search page" do
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
        click_on "Delete"

        # check the player is not in the list
        expect(page).to have_content "Your search revealed no players"
      end
    end
  end
end
