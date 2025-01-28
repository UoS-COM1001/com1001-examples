CREATE TABLE customers (
  username TEXT PRIMARY KEY,
  iv BLOB,
  salt BLOB,
  data_crypt BLOB
);