module Types
  class MutationType < ::Types::Base::Object
    include ::Mount::Mutation

    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
