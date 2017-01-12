BlogType = GraphQL::ObjectType.define do
  name 'Blog'
  description 'A Blog'

  field :title, types.String
  field :content, types.String
  field :author do
    type AuthorType
    resolve lambda { |obj, _args, _ctx|
      obj.author
    }
  end
end
