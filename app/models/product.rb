class Product
  include Virtus.model

  attribute :id,                  Integer
  attribute :name,                String
  attribute :price,               BigDecimal

end
