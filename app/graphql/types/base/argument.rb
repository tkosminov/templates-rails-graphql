module Types
  module Base
    class Argument < GraphQL::Schema::Argument
      def initialize(*args, required: true, camelize: false, **kwargs, &block)
        super
      end
    end
  end
end
