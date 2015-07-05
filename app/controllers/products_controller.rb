class ProductsController < ApplicationController

	before_action :set_product, except: [:index, :new, :create ]

	def new 
		@product = Product.new
	end

	def create
		@product =  Product.new(product_params)
		if @product.save
			flash[:notice] = "product created successfully."
			redirect_to products_path
		else 
			render 'new'
		end
	end

	def index
		@products =  Product.all
	end

	def show

	end

	def edit

	end

	def update
		if @product.update_attributes(product_params)
			flash[:notice] = "product updated successfully."
			redirect_to products_path
		else
			render  'edit'
		end
	end

	def destroy
		if @product.destroy
			flash[:notice] = "product deleted successfully."     
			redirect_to products_path
		end
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
    #params.require(:product).permit(:name, :product_show)
    params.require(:product).permit!
end

end
