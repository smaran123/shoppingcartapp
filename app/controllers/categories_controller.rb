class CategoriesController < ApplicationController
 #before_action :set_category, only: [:edit, :update, :show, :destroy ]
before_action :set_category, except: [:index, :new, :create ]

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully."
      redirect_to categories_path
    else 
      render 'new'
    end
  end

  def index
    @categories = Category.all
  end

  def show
    #@products = Product.searching(params[:id], params[:search])
  end

  def edit
    
  end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = "Category updated successfully."
      redirect_to categories_path
    else
      render  'edit'
    end
  end


	

  def destroy
    if @category.destroy
      flash[:notice] = "Category deleted successfully."     
      redirect_to admin_categories_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    #params.require(:category).permit(:name, :category_show)
        params.require(:category).permit!
  end


end
