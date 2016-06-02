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
      flash[:notice] = "event was successfully created" 
      redirect_to :action => :index
    else
      render :action => :new
    end

  end

  def show
  end

  def edit
  end

  def update
    @dumming = Inventory.new
    @dumming = @inventory.dup
    if @inventory.update(inventory_param)
      flash[:notice] = "event was successfully updated" if !check_changing(@dumming, @inventory)
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

  def check_changing(a,b)
    a.item == b.item &&
    a.description == b.description &&
    a.price == b.price &&
    a.stock == b.stock &&
    a.lack == b.lack
  end

end
