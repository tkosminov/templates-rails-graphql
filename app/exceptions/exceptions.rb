module Exceptions
  # GraphQL

  class Exceptions::Graphql < StandardError; end

  # Postgres

  class PGNotNullViolation < StandardError
    def message
      'PG::NotNullViolation'
    end
  end

  class PGUniqueViolation < StandardError
    attr_accessor :msg

    def initialize(msg: nil)
      super

      @msg = 'PG::UniqueViolation'

      if msg.present?
        if msg.include?('index_unique_email_on_users')
          @msg = 'Email already exists'
        elsif msg.include?('index_unique_login_for_organization_on_users')
          @msg = 'Login already exists'
        elsif msg.include?('index_user_users_on_identification_number_and_organization_id')
          @msg = 'Identification number already exists'
        end
      end
    end

    def message
      @msg
    end
  end
end
