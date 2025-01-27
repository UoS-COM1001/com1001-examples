# `helpers` directory

This directory is for files of library functions used by your app. These are
placed in modules. They are the equivalent to classes containing only static
methods in Java, and could be accessed anywhere in your application. 

Initially this directory provides the `Validation` module for you, with various
helper methods for validating user inputs, e.g. email addresses and numbers. 

You can add more validation methods to this module if you wish.

## Adding your own helper modules

You can add more helper modules by adding their files to this directory. You'll
then need to register them in the [`app.rb`](../app.rb) file in the root
directory so that your Sinatra app can use them. This is done by modifying 
the section of code that reads as follows:

```
# Register helpers
helpers do
  include ERB::Util # This is so that we get to use the "h" method in views
  include Validation
  
  # add more modules here if needed, e.g.:
  # include YourHelperModule
end
```