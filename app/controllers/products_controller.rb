class ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @products = Product.all

    render json: @products.order(:title).to_json
  end

  def show_by_id

      @p =render json: Product.find_by(id: params["id"])



    if @p.present?

    else
      render(:json => {msg: "there are not products"}.to_json,
        :status => 404)
    end
  end

  def order_by_title

    if (params["order"] != "1")
      @p =render json: Product.order(params["value"])
    else
      @p =render json: Product.order(params["value"]).reverse
    end


    if @p.present?

    else
      render(:json => {msg: "there are not products"}.to_json,
        :status => 404)
    end
  end

  def filter
    data = JSON.parse(request.body.read)
    min = data["minval"].presence || 0
    max = data["maxval"].presence || 9999
    if (data["title"].empty?)
      @p =render json: Product.where("price >= ? AND price <= ?", min , max)
    else
      @p =render json: Product.where("LOWER(title) LIKE ? and price >= ? AND price <= ?", "%#{data["title"].downcase}%", min , max)
    end
  end
end
