# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require_relative 'app/exceptions/exceptions'
require_relative 'app/enums/enums'

run Rails.application
Rails.application.load_server
