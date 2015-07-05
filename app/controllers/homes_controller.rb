class HomesController < ApplicationController
  def index
   @categories = []
   # @categories = Category.all
  end

   def show
   @category = Category.find(params[:id])
   @products = @category.products
 end

def category
	 @categories = Category.where("id = '#{params[:category_id]}'")

    respond_to do |format|
          format.js
      end

end

end

