class CreateAttractionHasReviews < ActiveRecord::Migration
  def change
    create_table :attraction_has_reviews do |t|
      t.references :attraction, index: true
      t.references :review, index: true

      t.timestamps
    end
  end
end
