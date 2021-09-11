module Types
  class QueryType < ::Types::Base::Object
    include ::Mount::Query

    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end
  end
end
