Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get 'healthz', to: 'healthcheck#healthz', as: :health_check

  unless Rails.env.production?
    mount(GraphiQL::Rails::Engine, at: '/graphiql',
                                   graphql_path: '/graphql')
  end

  post '/graphql', to: 'graphql#execute'
end
