RSpec.describe "Searching for a player" do
  context "when no players have been added" do
    it "then shows no players" do
      visit "/"
      expect(page).to have_content "Your search revealed no players"
    end
  end

  context "when one player has been added" do
    it "lists the player" do
      visit "/add"
      fill_in "first_name", with: "George"
      fill_in "surname", with: "Test"
      fill_in "gender", with: "M"
      fill_in "club", with: "Mantester Utd"
      fill_in "country", with: "Northern RSpec"
      fill_in "position", with: "Midfield"
      fill_in "date_of_birth", with: "1946-05-22"
      click_on "Submit"

      expect(page).to have_content "George Test"
    end

    it "does not list the player when a different club is searched for" do
      visit "/add"
      fill_in "first_name", with: "George"
      fill_in "surname", with: "Test"
      fill_in "gender", with: "M"
      fill_in "club", with: "Mantester Utd"
      fill_in "country", with: "Northern RSpec"
      fill_in "position", with: "Midfield"
      fill_in "date_of_birth", with: "1946-05-22"
      click_on "Submit"

      fill_in "club_search", with: "RSpec F.C."
      click_on "Submit"

      expect(page).to have_content "Your search revealed no players"
    end

    it "lists the player when their club is searched for" do
      visit "/add"
      fill_in "first_name", with: "George"
      fill_in "surname", with: "Test"
      fill_in "gender", with: "M"
      fill_in "club", with: "Mantester Utd"
      fill_in "country", with: "Northern RSpec"
      fill_in "position", with: "Midfield"
      fill_in "date_of_birth", with: "1946-05-22"
      click_on "Submit"

      fill_in "club_search", with: "Mantester Utd"
      click_on "Submit"
      expect(page).to have_content "George Test"
    end
  end
end
