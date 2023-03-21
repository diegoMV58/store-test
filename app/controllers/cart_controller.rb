class CartController < ApplicationController
  protect_from_forgery with: :null_session

  def add_to_cart
    data = JSON.parse(request.body.read)
    @p =render json: Cart.create(product_id: data["id"], quantity: data["qnt"],total: data["total"])
    if @p.present?

    else
      render(:json => {msg: "cant add to the cart"}.to_json,
        :status => 404)
    end
  end
  def search
    @cart = Cart.includes(:product)
    render json: @cart.as_json(include: :product)
  end
  def delete
    cart = Cart.find(params["id"])
    cart.destroy
  end
  def update
    data = JSON.parse(request.body.read)
    data.each_with_index do |quantity, index|
      Cart.where(id: index).update(quantity: quantity)
    end
    head :ok
  end
end
