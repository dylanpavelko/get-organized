class AddTripAdvisorLinkToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :trip_advisor_link, :string
  end
end
