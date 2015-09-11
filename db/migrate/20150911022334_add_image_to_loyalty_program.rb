class AddImageToLoyaltyProgram < ActiveRecord::Migration
  def change
    add_column :loyalty_programs, :image, :string
  end
end
