class CategoriesController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  def index
    @categories = Category.where(user: current_user).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    return unless @category.save

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
