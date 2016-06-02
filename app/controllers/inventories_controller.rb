class InventoriesController < ApplicationController

  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_param)
    @inventory.save

    redirect_to :action => :index
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

private

  def inventory_param
    params.require(:inventory).permit(:item, :description, :price, :stock, :lack)
  end

end
