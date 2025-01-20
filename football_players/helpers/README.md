# `helpers` directory

This directory is for files of library functions used by your app. These are
placed in modules. They are the equivalent to classes containing only static
methods in Java, and could be accessed anywhere in your application.

Initially this directory provides the `Validation` module for you, with various
helper methods for validating user inputs, e.g. email addresses and numbers.

You can add more validation methods to this module if you wish - see below
for instructions on how to do this.

## Adding your own helper modules

You can add more helper modules by adding their files to this directory. You'll
then need to ensure they are loaded by creating a new file in this directory
called `local_helpers` and then adding include statements as needed,
e.g. `include my_local_helper`.