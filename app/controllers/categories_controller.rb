class CategoriesController < ApplicationController
  before_action :admin_only!, except: [:index]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category successfully created'
    else
      redirect_to root_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

end
