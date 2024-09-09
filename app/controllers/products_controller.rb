class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    @product.images.attach(params[:product][:images])

    if @product.save
      # redirect to the index page

      redirect_to products_path, notice: 'Produit créé ave succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash[:notice] = "Produit supprimé avec succès"
      redirect_to products_path, status: :see_other
    else
      flash[:alert] = "Une erreur est survenue lors de la suppression du produit"
      redirect_to products_path, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, images: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
