module Types
  module Base
    class Mutation < GraphQL::Schema::RelayClassicMutation
      include ::Mount::CurrentUser

      argument_class ::Types::Base::Argument
      field_class ::Types::Base::Field
      input_object_class ::Types::Base::InputObject
      object_class ::Types::Base::Object
    end
  end
end
