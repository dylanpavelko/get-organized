class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.references :comment, index: true
      t.references :reviewer, index: true
      t.boolean :public

      t.timestamps
    end
  end
end
