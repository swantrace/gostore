class StoreController < ApplicationController
  def index
    @cart = current_cart
    if params[:category].present?
      if Category.find_by_name(params[:category]).present?
         @products = Category.find_by_name(params[:category])
      else  
         @products = Product.all
      end     
    else
      @products = Product.all
    end
  end
  
  def show
    @cart = current_cart
    @categories = Category.all
    @product = Product.find(params[:id])
  end
  
  def search
    @cart = current_cart
    # No code is required here.
  end # Automatically loads app/views/store/search.html.erb
  
  def search_results
    @cart = current_cart
    if params[:category].present?
      @products = Product.where('category_id' => params[:category])
    end
    if params[:keywords].present?# Here we will be using the Product model to actually search.
      @products = Product.where("title LIKE ? OR description LIKE? ", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    end
  end
end