# `db` (Database) directory

This is where all files related to your database should live. Your schema (i.e., your `CREATE TABLE` SQL statements) should be written into the initially blank `schema.sql` file. 

You can then use this to create the two SQLite3 database files that you will need, `development.sqlite3` and `testing.sqlite3`. First, open a terminal and change directory to that of this file, e.g. (where `my_app` is the path to your application):

```
cd my_app/db/
```

and then running the `create_db` command twice as follows:

```
create_db schema.sql development.sqlite3
```

and 

```
create_db schema.sql testing.sqlite3
```

The `db.rb` file will load the correct database file depending on whether the app is being run or tested by checking the `"APP_ENV"` key of the global `ENV` hash. This key is set to `"testing" by the tests, else is equal to `"development"`. If the relevant database file does not exist, none is loaded, although this will cause an error if your app uses a model and is therefore expecting it to exist. 

All activity is logged to `developement.log` or `testing.log` depending on what mode your app is being run in. 
