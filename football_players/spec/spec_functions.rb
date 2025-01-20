def spec_before
  Player.dataset.delete
end

def add_test_player_to_db(first_name = "George", surname = "Test", gender = "M", club = "Mantester Utd",
    country = "Northern RSpec", position = "Midfield", date_of_birth = "1946-05-22")
  player = Player.new
  player.first_name = first_name
  player.surname = surname
  player.gender = gender
  player.club = club
  player.country = country
  player.position = position
  player.date_of_birth = date_of_birth
  player.save_changes
  player
end
