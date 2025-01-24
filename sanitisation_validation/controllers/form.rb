get "/" do
  # check whether the form was actually submitted
  @form_was_submitted = !params.empty?

  # fetch each field from the @params hash (defaulting to
  # empty string if not present) and sanitise
  @first_name = params.fetch("first_name", "").strip
  @surname = params.fetch("surname", "").strip
  @age = params.fetch("age", "").strip
  @email_address = params.fetch("email_address", "").strip

  if @form_was_submitted
    # add validation messages
    @first_name_error = "Please enter your first name" if @first_name.empty?
    @surname_error = "Please enter your surname" if @surname.empty?
    @age_error = "Please enter your age" unless str_integer?(@age)
    @email_address_error = "Please enter a valid email address" unless str_email_address?(@email_address)

    unless @first_name_error.nil? && @surname_error.nil? && @age_error.nil? && @email_address_error.nil?
      @submission_error = "Please correct the errors below"
    end

    if @submission_error.nil?
      # ... in a real application we would do some processing with the data here ...
    end
  end

  erb :form
end
