class FoodItem < ActiveRecord::Base
    
    def get_Inventory_Options
        @options = InventoryOption.where(:food_items_id => self.id)
    end
    
    def get_average_price_for_amount(amount, unit_type)
        @options = get_Inventory_Options
        if @options != nil 
            if @options.count > 0
                @price = @options.first.inventory_item.average_price_by(unit_type)
                if amount != ""
                    @price = @price * amount.to_f
                end
                return @price
            else
                return nil
            end
        else 
            return nil
        end
    end
end