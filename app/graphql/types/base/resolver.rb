module Types
  module Base
    class Resolver < GraphQL::Schema::Resolver
      include ::Mount::CurrentUser

      argument_class ::Types::Base::Argument
    end
  end
end
