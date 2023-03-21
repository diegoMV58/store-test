class FakeStoreClient
  BASE_URI = 'https://fakestoreapi.com'

  def self.get_products
    response = HTTParty.get("#{BASE_URI}/products")
    response.map do |product|
      ProductAdapter.new(id: product['id'], title: product['title'],
        description: product['description'], image: product['image'], price: product['price'],
        rating: product['rating']['rate'], stock: product['rating']['count'], category: product['category'],
        external_url: BASE_URI )
    end
  end
end
