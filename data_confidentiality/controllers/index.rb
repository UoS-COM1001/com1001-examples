get "/" do
  @logged_in = session[:logged_in]
  @username = session[:username]
  @data = session[:data]
  erb :index
end
