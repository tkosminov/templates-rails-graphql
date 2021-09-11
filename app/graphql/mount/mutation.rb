require 'active_support/concern'

module Mount
  module Mutation
    extend ActiveSupport::Concern

    class_methods do
      def mount_mutation(mutation_class, **custom_kwargs)
        field mutation_class.graphql_name.to_sym,
              mutation: mutation_class,
              **custom_kwargs
      end
    end
  end
end
