get "/logout" do
  session.clear
  redirect "/"
end
