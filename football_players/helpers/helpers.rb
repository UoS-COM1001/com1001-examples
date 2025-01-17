require_relative "validation"
# Add more "require" statements for your helpers here

# Register helpers with Sinatra
helpers do
  # This is so that we get to use the "h" method in views
  include ERB::Util

  # This is so that we include useful validation methods
  include Validation

  # Add your modules here that you "required" above, e.g.:
  # include YourHelperModule
end
