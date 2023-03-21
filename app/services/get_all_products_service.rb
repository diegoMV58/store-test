class GetAllProductsService < ApplicationService
  def call
    Product.all
  end
end


