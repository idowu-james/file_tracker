class CategoriesController < ApplicationController
	before_action :set_categories , only: [:edit, :update, :delete, :destroy]
	before_action :reg_officer_admin, only: [:index]
	before_action :admin, except: [:index]
  def index
  	@categories = Category.sorted
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to categories_url , :notice => 'New Category Successfuly Created'
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @category.update(category_params)
  		redirect_to categories_url, :notice => 'Category Successfuly Updated'
  	else
  		render 'edit'
  	end
  end

  def delete
  	
  end

  def destroy
  	@category.destroy
  	redirect_to categories_url
  end


  private

  def set_categories
  	@category = Category.find(params[:id])
  end

  def category_params
  	params.require(:category).permit(:name)
  end
end
