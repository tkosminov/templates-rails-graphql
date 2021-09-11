require 'active_support/concern'

module Mount
  module CurrentUser
    extend ActiveSupport::Concern

    included do
      def current_user
        context[:current_user]
      end

      def current_user_id
        self.current_user[:id]
      rescue NoMethodError
        nil
      end

      def forwarded_address
        context[:forwarded_address]
      end
    end
  end
end
