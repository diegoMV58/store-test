class ProductAdapter
  attr_accessor :id, :title, :description, :image, :price, :rating, :stock, :category, :external_url

  def initialize(id:, title:, description:, image:, price:, rating:, stock:, category:, external_url:)
    @id = id
    @title = title
    @description = description
    @image = image
    @price = price
    @rating = rating
    @stock = stock
    @category = category
    @external_url = external_url
  end
end
