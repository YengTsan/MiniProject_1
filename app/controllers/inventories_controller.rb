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

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])
    @inventory.update(inventory_param)

    redirect_to :action => :index
  end

private

  def inventory_param
    params.require(:inventory).permit(:item, :description, :price, :stock, :lack)
  end

end
