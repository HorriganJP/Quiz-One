class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    
    redirect_to root_path
  end

  def update 
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      flash[:notice] = "Item deleted!"
      redirect_to root_path
    else
      flash[:error] = "Failed to delete this item."
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:task, :description, :due)
  end
end
