class ProductRepository
  @@products = [
    Product.new(id: 1,
                name: 'Docker In Action',
                price: 59.0),

    Product.new(id: 2,
                name: 'Agile In Action',
                price: 55.0)
  ]

  def self.list
    @@products
  end

  def self.find(id)
    @@products.find do |product|
      product.id == id
    end
  end
end
