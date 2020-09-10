class ProductsController < ApplicationController
  before_action :product, only: [:show, :update, :destroy]
  helper_method :product

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      flash[:danger] = @product.errors.full_messages.to_sentence
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if product.update(product_params)
      redirect_to products_path, flash: { success: 'updated'}
    else
      render 'edit'
      flash[:error] = 'Something went wrong'
    end
  end

  def destroy
    name = product.name
    product.destroy
    redirect_to products_path, flash: { success: "Deleted #{name}" }
  end

  private

  def product_params
    params.require(:product).permit(:name, :category, :description)
  end

  def product
    Product.find(params[:id])
  end
end
