### Setup

```ruby
bundle
bin/rails db:setup
```


### Query GraphQL

###### Blog

```sh
curl -XPOST -d 'query={ blog(id: 1) { title content }}' http://localhost:3000/queries
```


###### Blog & Author

```sh
curl -XPOST -d 'query={ blog(id: 1) { title content author { name }}}' http://localhost:3000/queries
```
