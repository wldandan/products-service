class ProductRepository

  def self.list()

    product1 = Product.new({id: 1,
                            name: 'Docker In Action',
                            price: 59.0})

    product2 = Product.new({id: 2,
                            name: 'Agile In Action',
                            price: 55.0})

    [product1, product2]
  end
end
