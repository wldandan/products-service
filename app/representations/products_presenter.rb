require 'roar/decorator'
require 'roar/json'
require 'roar/json/hal'

class ProductsPresenter < Roar::Decorator
  include Roar::JSON
  include Roar::JSON::HAL
  
  collection :entries,
             as: :products,
             embedded: false,
             extend: ProductPresenter
end
