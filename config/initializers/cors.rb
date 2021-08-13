# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*', headers: :any, methods: :any, credentials: true
  end

  allow do
    origins 'https://willywallet.herokuapp.com'

    resource '/sign_up', headers: :any, methods: :any, credentials: true
  end

  allow do
    origins 'https://willywallet.herokuapp.com'

    resource '/sign_in', headers: :any, methods: :any, credentials: true
  end

  allow do
    origins 'https://willywallet.herokuapp.com/dashboard'

    resource '*', headers: :any, methods: :any, credentials: true
  end

  # allow do
  #   origins 'https://willywallet.herokuapp.com/transaction'

  #   resource '*', headers: :any, methods: :any, credentials: true
  # end

  # allow do
  #   origins 'https://willywallet.herokuapp.com/logput'

  #   resource '*', headers: :any, methods: :any, credentials: true
  # end
end
