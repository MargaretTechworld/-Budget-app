class ItemsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @items = @category.items.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @item = Item.new
  end

  def create
    @category = Category.find(params[:category_id])
    @item = current_user.items.build(items_params)

    if @item.save
      ItemCategory.create(category: @category, item: @item)
      redirect_to category_items_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :amount, :icon)
  end
end
