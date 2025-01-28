get "/login" do
  redirect "/" if session[:logged_in]
  erb :login
end

post "/login" do
  @error = "Username/Password combination incorrect"
  username = params.fetch("username", "").strip
  customer = Customer.first(username: username)

  unless customer.nil?
    data = customer.login(params)

    unless data.nil?
      session[:logged_in] = true
      session[:username] = username
      session[:data] = data
      redirect "/"
    end
  end

  erb :login
end
