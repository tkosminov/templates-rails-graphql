module Types
  module Base
    class Object < GraphQL::Schema::Object
      include ::Mount::CurrentUser

      field_class ::Types::Base::Field
    end
  end
end
