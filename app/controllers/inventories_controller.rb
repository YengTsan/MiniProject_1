class InventoriesController < ApplicationController

  def index
    @inventory = Inventory.all
  end

end
