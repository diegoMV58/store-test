class DummyClient
  BASE_URI = 'https://dummyjson.com'

  def self.get_products
    response = HTTParty.get("#{BASE_URI}/products")

    response['products'].map do |product|
      ProductAdapter.new(id: product['id'], title: product['title'],
        description: product['description'], image: product['images'].first, price: product['price'],
        rating: product['rating'], stock: product['stock'], category: product['category'], external_url: BASE_URI )
    end
  end
end

