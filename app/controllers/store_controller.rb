class StoreController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
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