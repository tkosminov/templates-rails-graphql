source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 3.0'

#######
### default
#######

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# https://github.com/rails/rails
gem 'rails', '~> 6.1.4'

# Use Puma as the app server
# https://github.com/puma/puma
gem 'puma', '~> 5.0'

# Use PostgreSQL as the database for Active Record
# https://github.com/ged/ruby-pg
gem 'pg'

# Build JSON APIs with ease.
# https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Reduces boot times through caching; required in config/boot.rb
# https://github.com/Shopify/bootsnap
gem 'bootsnap', '>= 1.4.4', require: false

# TZInfo - Ruby Timezone Library
# https://github.com/tzinfo/tzinfo
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Rack-based asset packaging system
# https://github.com/rails/sprockets
gem 'sprockets', '~> 3' # https://github.com/rmosolgo/graphiql-rails/issues/53#issuecomment-547223227

######
### application
######

# Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
# https://github.com/cyu/rack-cors
gem 'rack-cors'

# Rack middleware for blocking & throttling abusive requests
# https://github.com/kickstarter/rack-attack
gem 'rack-attack'

# Rack::UTF8Sanitizer is a Rack middleware which cleans up invalid UTF8 characters in request URI and headers.
# https://github.com/whitequark/rack-utf8_sanitizer
gem 'rack-utf8_sanitizer'

######
### auth
######

# Use ActiveModel has_secure_password
# https://github.com/codahale/bcrypt-ruby
gem 'bcrypt'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
# https://github.com/jwt/ruby-jwt
gem 'jwt'

######
### xlsx
######

# xlsx generation
# https://github.com/caxlsx/caxlsx
gem 'caxlsx'

# A Rails plugin to provide templates for the axlsx gem
# https://github.com/caxlsx/caxlsx_rails
gem 'caxlsx_rails'

# Rubyzip is a ruby library for reading and writing zip files.
# https://github.com/rubyzip/rubyzip
gem 'rubyzip', '>= 1.2.1'

######
### api's
######

# Mount the GraphiQL query editor in a Rails app
# https://github.com/rmosolgo/graphiql-rails
gem 'graphiql-rails'

# Ruby implementation of GraphQL
# https://github.com/rmosolgo/graphql-ruby
gem 'graphql', '~> 1.11.5'

# A query batching executor for the graphql gem
# https://github.com/Shopify/graphql-batch
gem 'graphql-batch'

# Makes http fun again!
# https://github.com/jnunemaker/httparty
gem 'httparty'

######
### development
######

group :development do
  # Manage Procfile-based applications
  # https://github.com/ddollar/foreman
  gem 'foreman'

  # The Listen gem listens to file modifications and notifies you about the changes
  # https://github.com/guard/listen
  gem 'listen', '~> 3.3'

  # Spring speeds up development by keeping your application running in the background.
  # https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # A runtime developer console and IRB alternative with powerful introspection capabilities
  # https://github.com/rweng/pry-rails
  gem 'pry-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # https://github.com/deivid-rodriguez/byebug
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide
  # https://github.com/rubocop-hq/rubocop
  gem 'rubocop'
end
