module Types
  module Base
    class Field < GraphQL::Schema::Field
      argument_class ::Types::Base::Argument

      def initialize(*args, null: false, camelize: false, **kwargs, &block)
        super
      end
    end
  end
end
