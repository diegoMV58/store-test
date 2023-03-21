class PurchaseController < ApplicationController
  protect_from_forgery with: :null_session
  def save
    data = JSON.parse(request.body.read)
    number_prc = rand(9)
    data.each_with_index do |quantity, index|
      render json: Purchase.create(product_id: index, quantity: quantity,purchase_id: number_prc)
    end
    head :ok
    Cart.delete_all

  end

end
