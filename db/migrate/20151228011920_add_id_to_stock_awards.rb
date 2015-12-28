class AddIdToStockAwards < ActiveRecord::Migration
  def change
    add_column :stock_awards, :award_id, :string
  end
end
