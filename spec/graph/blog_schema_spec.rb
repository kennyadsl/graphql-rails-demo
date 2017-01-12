require 'rails_helper'

RSpec.describe BlogSchema do
  let(:result) do
    described_class.execute(query_string, context: {}, variables: {})
                   .deep_symbolize_keys
  end

  before do
    # TODO: add factories
    luke = Author.create(name: 'Luke Skywalker')
    Blog.create(
      title: 'Building a bot',
      content: 'How to build a bot day-to-day report',
      author: luke
    )
  end

  describe 'a generic blog query with ' do
    let(:query_string) { %|{ blog(id: 1) { title } }| }

    it 'return the blog' do
      expect(result.dig(:data, :blog))
        .to eq(title: 'Building a bot')
    end
  end

  describe 'a query with the author' do
    let(:query_string) { %|{ blog(id: 1) { title author { name } } }| }

    it 'return the blog author as well' do
      expect(result.dig(:data, :blog))
        .to eq(title: 'Building a bot', author: { name: 'Luke Skywalker' })
    end
  end
end
