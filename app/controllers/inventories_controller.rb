class InventoriesController < ApplicationController
  before_action :set_inventory, :only => [ :show, :edit, :update, :destroy]

  def index
    @inventories = Inventory.page(params[:page]).per(5)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_param)
    if @inventory.save
      redirect_to :action => :index
    else
      render :action => :new
    end
      flash[:notice] = "event was successfully created"
  end

  def show
  end

  def edit
  end

  def update
    if @inventory.update(inventory_param)
      flash[:notice] = "event was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @inventory.destroy
    flash[:alert] = "event was successfully delete"
    redirect_to :action => :index
  end

private

  def inventory_param
    params.require(:inventory).permit(:item, :description, :price, :stock, :lack)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

end
