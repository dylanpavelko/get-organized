class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :reply_to, index: true
      t.references :author, index: true

      t.timestamps
    end
  end
end
