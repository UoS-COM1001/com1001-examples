# COM1001 Examples Repository

This repository contains Ruby/Sinatra examples from the Spring Semester of the COM1001 module at the University of Sheffield.

It is designed so that you can clone it on Codio and try out the examples discussed in lectures in your own time. 
You can also try to modify the examples to udnerstand how they work.

To clone the repository, open a new terminal in Codio and issue the following command:

```console
git clone https://github.com/UoS-COM1001/com1001-examples.git
```

The repository will be cloned to a directory called `com1001-examples`. Each example application lives in its own individual subdirectory. 
To run an example, change to its directory in the terminal and issue the `sinatra` command. If it has a Gemfile, you may also need to do a `bundle install` to install gems required by the application for it to work.
For example:

```console
cd com1001-examples/football_players
bundle install
sinatra
```
