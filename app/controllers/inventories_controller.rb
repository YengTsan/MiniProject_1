class InventoriesController < ApplicationController
  before_action :set_inventory, :only => [:show, :edit, :update, :destroy]

  def index
    @inventories = Inventory.page(params[:page]).per(5)
    @inventory = Inventory.new
    flash[:current_page] = current_page_num
  end

  def edit
    @current_page = flash[:current_page]
    flash[:current_page] = flash[:current_page]
  end


  def create
    @inventory = Inventory.new(inventory_param)
    if @inventory.save
      flash[:notice] = "Inventory was successfully created"
      redirect_to_current_page
    else
      render :action => :new
    end
  end

  def show
    @current_page = flash[:current_page]
  end

  def show_back
    flash[:current_page] = flash[:current_page]
    redirect_to_current_page
  end

  def update
    @dumming = @inventory.dup
    if @inventory.update(inventory_param)
      if check_changing(@dumming, @inventory)
        flash[:notice] = "Inventory was successfully updated" 
      else
        flash[:notice] = "Nothing has been changed"
      end 
      redirect_to_current_page
    else
      @current_page = flash[:current_page]
      render :action => :edit
    end
  end

  def destroy
    @current_page = flash[:current_page]
    @inventory.destroy
    redirect_to_current_page
  end

private

  def inventory_param
    params.require(:inventory).permit(:item, :description, :price, :stock, :lack)
  end

  def current_page_num
    params.permit(:page)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def check_changing(a,b)
    !(a.item == b.item &&
    a.description == b.description &&
    a.price == b.price &&
    a.stock == b.stock &&
    a.lack == b.lack)
  end

  def redirect_to_current_page
    @page_num = "1"
    @page_num = flash[:current_page]["page"] if flash[:current_page].present?
    redirect_to (inventories_path + "?page=" + @page_num)
  end

end
