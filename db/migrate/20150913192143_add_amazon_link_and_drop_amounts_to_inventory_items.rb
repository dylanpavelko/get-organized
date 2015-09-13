class AddAmazonLinkAndDropAmountsToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :amazon_link, :string
    remove_column :inventory_items, :amount
  end
end
