require 'active_support/concern'

module Mount
  module Query
    extend ActiveSupport::Concern

    class_methods do
      def mount_query(resolver_class, **custom_kwargs)
        field resolver_class.graphql_name.to_sym,
              resolver: resolver_class,
              **custom_kwargs
      end
    end
  end
end
