class PlannedMeal < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :attraction
  belongs_to :planned_meal
  belongs_to :food_item
  
  def display_name
    @str = ""
    if self.eat_out
      @str = @str + "Eat Out-"
    end
    
    @str = @str + self.text 
    
    if self.recipe != nil
      @str = @str + self.recipe.name
    elsif self.food_item != nil
      @str = @str + self.food_item.name
    elsif self.attraction != nil
      @str = @str + self.attraction.name
    else 
      @str = @str + self.url
    end
    
    return @str
  end
  
  def display_name_with_date
    return self.meal_date.strftime("%m/%d/%Y") + " " + self.display_name
  end
  
  def meal_type_label
    if self.meal_type == 1
      return "Dinner"
    elsif self.meal_type == 2
      return "Lunch"
    elsif self.meal_type == 3
      return "Breakfast"
    elsif self.meal_type == 4
      return "Snack"
    else
      return "Other"
    end
  end
  
end
