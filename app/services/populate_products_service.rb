class PopulateProductsService < ApplicationService
  def call
    products_adapter = [*DummyClient.get_products, *FakeStoreClient.get_products]
    products_adapter.map { |product| products << build_product(product)}
    Product.insert_all(products)
  end

  private

  def build_product(product_adapter)
    {
      external_id: product_adapter.id, title: product_adapter.title.capitalize,
      description: product_adapter.description, price: product_adapter.price,
      image: product_adapter.image, rating: product_adapter.rating,
      stock: product_adapter.stock, category: product_adapter.category,
      external_url: product_adapter.external_url
    }
  end

  def products
    @products ||= []
  end

  def products_adapter
    @products_adapter ||= []
  end
end
