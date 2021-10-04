class Api::V1::ProductsController < ApplicationController
  before_action :product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      ProductActiveJob.set(wait: 3.minutes).perform_later @product
      render json: @product
    else
      render error: { error: 'Unable to create Product' }, status: 400
    end
  end

  def update
    if @product.update(product_params)
      render json: { message: 'Product succesffully updated.' }, status: 200
    elsif
      render error: { error: 'Unable to update Product' }, status: 400
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'Product successfully deleted.' }, status: 200
    else
      render error: { error: 'Unable to delete Product' }, status: 400
    end
  end

  private
  def product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :user_id, :price, :category, :image, :is_active)
  end
end
