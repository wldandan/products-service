require 'roar/decorator'
require 'roar/json'
require 'roar/json/hal'

class ProductsPresenter < Roar::Decorator
  include Roar::JSON
  include Roar::JSON::HAL

  link :self do |opts, endpoint = opts[:env]['api.endpoint']|
    endpoint.self_link
  end

  property :count, getter: proc { length }

  collection :entries,
             as: :products,
             embedded: true,
             extend: ProductPresenter
end
