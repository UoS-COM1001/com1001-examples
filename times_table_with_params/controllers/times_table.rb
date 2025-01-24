get "/times-table" do
  # set @multiplicand if the "m" key is set in the params and its an integer
  param = params.fetch("m", nil)
  @multiplicand = param.to_i if str_integer?(param)

  # set @limit via the same process
  param = params.fetch("l", nil)
  @limit = param.to_i if str_integer?(param)

  # if we have values for @multiplicand and @limit
  # at this point (that is, they are not nil) then we have
  # valid parameters (else, we do not)
  @params_valid = !@multiplicand.nil? && !@limit.nil?

  erb :times_table
end
