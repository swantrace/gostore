class StoreController < ApplicationController
  def index
    @cart = current_cart
    if params[:category].present?
      if Category.find_by_name(params[:category]).present?
         @products = Category.find_by_name(params[:category]).products
      end     
    else
      @products = Product.all
    end
  end
  
  def show
    @cart = current_cart
    @product = Product.find(params[:id])
  end
  
  def search
    # No code is required here.
  end # Automatically loads app/views/store/search.html.erb
  
  def search_results
    # Here we will be using the Product model to actually search.
    @products = Product.where("title LIKE ? OR description LIKE? ", "%#{params[:keywords]}%")
  end
end