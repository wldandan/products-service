require 'roar/decorator'
require 'roar/json/hal'

class ProductPresenter < Roar::Decorator
  include Roar::JSON::HAL

  property :id
  property :name
  property :price, getter: lambda { |_| '%.2f' % price }

end

