class AddHotelToAttraction < ActiveRecord::Migration
  def change
    add_reference :attractions, :hotel, index: true
  end
end
