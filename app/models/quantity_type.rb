class QuantityType < ActiveRecord::Base
    
    def standardized
        if self.quantityType.include? "pound"
            return " lbs"
        elsif self.quantityType.include? "oz"
            return " oz"
        elsif self.quantityType.include? "gallon"
            return " gal"
        elsif self.quantityType.include? "lb"
            return " lbs"
        elsif self.quantityType.include? "cup"
            return " cup"
        elsif self.quantityType.include? "tablespoon"
            return " tbsp"
        elsif self.quantityType.include? "teaspoon"
            return " tsp"
        else
            return " "
        end
    end
end
