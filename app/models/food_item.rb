class FoodItem < ActiveRecord::Base
    
    def get_Inventory_Options
        @options = InventoryOption.where(:food_items_id => self.id)
    end
    
    def get_average_price_for_amount(amount, unit_type)
        @options = self.get_Inventory_Options
        if @options.count > 0
            @price = @options.first.inventory_item.average_price_by(unit_type)
            if amount != "" and amount != nil and @price != nil
                #convert any fractional amounts to decimal
                if amount.include? " "
                    @number_parts = amount.split(" ")
                    @fraction_halves = @number_parts[1].split("/")
                    amount = (@number_parts[0].try :to_d + (@fraction_halves[0].try :to_d / @fraction_halves[1].to_d)).try :to_f
                else
                    amount = amount.to_f
                end
                #get price
                if unit_type_match(unit_type.standardized, @options.first.inventory_item.quantity_type.standardized) == 1
                    if self.pounds_per_cup != nil and self.pounds_per_cup != ""
                        @volume_in_weight_amount = volume_to_weight(amount, unit_type.standardized, @options.first.inventory_item.quantity_type.standardized)
                        @price = @price * @volume_in_weight_amount
                    else
                        @price = nil
                    end
                else
                    @price = @price * amount.to_f
                end
            end
            return @price
        else
            return nil
        end
    end
    
    def weight_to_volume(weight_amount, weight_type, volume_type)
        #convert to pounds
        @weight = Unit.new(weight_amount.to_s + " " + weight_type.standardized)
        @weight.convert_to("lbs")
        #convert to volume in cups
        @volume = @weight / self.pounds_per_cup
        #convert to desired volume
        @volume = Unit.new(@volume + " " + volume_type.standardized)
        return @volume
    end
    
    
    def volume_to_weight(volume_amount, volume_type, weight_type)
        #convert to cups
        @volume = Unit.new(volume_amount.to_s + " " + volume_type)
        @volume.convert_to("cups")
        #convert to volume in weight
        @multiplier = @volume.scalar * self.pounds_per_cup
        @weight = Unit.new(@multiplier.to_s + " lbs")
        #convert to desired weight
        @weight = @weight.convert_to(weight_type)
        return @weight.scalar
    end
    
    def unit_type_match(desired_units, base_units)
        if [" lbs"," oz"].include? base_units and [" cup"," tbsp"," tsp"].include? desired_units
          return 1
        else
          return 0
        end
    end

end