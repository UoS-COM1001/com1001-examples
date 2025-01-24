get "/times-table" do
  #  check if the "m" (multiplicand) value was supplied
  if params.key?("m")
    param = params["m"]

    # if the value is an integer (checked via a regular expression)
    if param.match?(/^(\d)+$/)
      # change the variable from a string to an integer type
      # and assign to @multiplicand
      @multiplicand = param.to_i
    end
  end

  # check the "l" (limit) value was supplied, and process
  # in the same way as the multiplicand value above
  if params.key?("l")
    param = params["l"]
    @limit = param.to_i if param.match?(/^(\d)+$/)
  end

  # if we have values for @multiplicand and @limit
  # at this point (that is, they are not nil) then we have
  # valid parameters (else, we do not)
  @params_valid = !@multiplicand.nil? && !@limit.nil?

  erb :times_table
end
