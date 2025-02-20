# `views` directory

This is where your `.erb` ("embedded Ruby") files go.

Remember that an `.erb` doesn't have to be complete HTML files – they themselves can embed further `.erb` files that are commonly re-used fragments of pages, for example, headers and footers. For example:

```
<!-- common header file, in header.erb in this directory -->
erb :header

<!-- main body of page goes here -->

<!-- common header file, in footer.erb in this directory -->
erb :footer
```