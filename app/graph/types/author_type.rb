AuthorType = GraphQL::ObjectType.define do
  name "Author"
  description "An Author"

  field :name, types.String
end
