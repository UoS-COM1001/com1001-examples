# `db` (Database) directory

This is where all files related to your database should live. Your schema (i.e.,
your `CREATE TABLE` SQL statements) should be written into the initially blank
`schema.sql` file. You may also put any data, in the form of SQL `INSERT`
statements into a file called `data.sql`, and these will be executed to populate
tables with data.

You can then use this to create the two SQLite3 database files that you will
need, `db.sqlite3` and `db_test.sqlite3` (although the latter, test database
will be blank and will not have the data in `data.sql` added).

First, open a terminal and change directory to that of this file, e.g. (where
`my_app` is the path to your application):

```
cd my_app/db/
```

and then running the `create_db` command as follows:

```
create_db
```

The `db.rb` file will load the correct database file depending on whether the
app is being run or tested by checking the "APP_ENV" key of the global "ENV"
hash. This key is set to "test" by the tests, so that the test database,
`db_test.sqlite3` is used in preference to the normally used `db.sqlite3`.

If the relevant database file does not exist, none is loaded, although this will
cause an error if your app uses a model and is therefore expecting it to exist.

All activity is logged to `db.log` or `db_test.log` depending on what mode your
app is being run in.
