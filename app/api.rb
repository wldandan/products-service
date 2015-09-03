require 'grape'
require 'api/product_api'

class API < Grape::API
  format :json
  content_type :json, 'application/hal+json'

  helpers do
    def resource_uri(request)
      remove_trailing_slash(remove_params(request.url))
    end

    def remove_params(uri)
      uri.gsub(/\?.*/, '')
    end

    def remove_trailing_slash(uri)
      uri.chomp('/')
    end
  end


  get '/' do
    'Hello world'
  end

  mount ProductApi => '/products'
end
