get "/" do
  @club_search = params.fetch("club_search", "").strip

  @players = if @club_search.empty?
               Player.all
             else
               Player.where(Sequel.ilike(:first_name, "%#{@club_search}%")).or(Sequel.ilike(:surname, "%#{@club_search}%"))
             end
  erb :search
end
