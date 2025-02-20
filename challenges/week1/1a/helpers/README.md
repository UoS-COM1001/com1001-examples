# `helpers` directory

This directory is for files of library functions used by your app. These are
placed in modules.

Initially this directory provides the `Validation` module for you, with various
helper methods for validating user inputs, e.g. email addresses and numbers.

You can add more helper modules by adding their files to this directory. You'll
then need to create a file called `my_helpers.rb` in this directory, and use
`include` statements to ensure they are included (loaded) by the application.