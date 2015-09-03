require 'grape'
require 'api/product_api'

class API < Grape::API
  format :json
  content_type :json, 'application/hal+json'

  get '/' do
    'Hello world'
  end

  mount ProductApi => '/products'
end
