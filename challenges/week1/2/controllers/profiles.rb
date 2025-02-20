get "/" do
  erb :index
end

get "/profile" do
  person = params.fetch("person", nil)

  @error = false

  if person == "donghwan"
    @fullname = "Donghwan Shin"
    @image = "donghwan"
  elsif person == "phil"
    @fullname = "Phil McMinn"
    @image = "phil"
  else
    @error = true
  end

  erb :profile
end
