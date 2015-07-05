class HomesController < ApplicationController
  def index
 # @category = Category.find(params[:id])
 #    @products = @category.products
  @categories = Category.all
  end

   def show
   @category = Category.find(params[:id])
   @products = @category.products
 end
end
