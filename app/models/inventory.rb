class Inventory < ActiveRecord::Base
  validates_presence_of :item, :description, :price, :stock
end
