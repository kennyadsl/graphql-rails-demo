QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for this schema'

  field :blog do
    type BlogType
    argument :id, !types.ID
    resolve lambda { |_obj, args, _ctx|
      Blog.find(args[:id])
    }
  end
end
