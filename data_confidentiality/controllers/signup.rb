get "/signup" do
  redirect "/" if session[:logged_in]
  @customer = Customer.new
  erb :signup
end

post "/signup" do
  @error = "Please correct the information below"
  @customer = Customer.new

  if @customer.signup(params)
    @customer.save
    redirect "/"
  end

  erb :signup
end
