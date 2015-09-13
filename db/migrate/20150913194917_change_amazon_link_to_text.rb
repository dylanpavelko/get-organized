class ChangeAmazonLinkToText < ActiveRecord::Migration
def up
    change_column :inventory_items, :amazon_link, :text
end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :inventory_items, :amazon_link, :string
end
end
