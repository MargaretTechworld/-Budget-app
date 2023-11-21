class CategoryController < ApplicationController
  def index; end

  def new
    @category = Item.new
  end
end
