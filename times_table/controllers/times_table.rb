get "/times-table" do
  @multiplicand = 8
  @limit = 10

  erb :times_table
end
