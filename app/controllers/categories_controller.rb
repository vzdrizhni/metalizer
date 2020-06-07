# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :admin_only!, except: %i[index show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.with_attached_image.includes([:tags, :categories])
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save && !current_user.nil?
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
