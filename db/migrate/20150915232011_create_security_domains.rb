class CreateSecurityDomains < ActiveRecord::Migration
  def change
    create_table :security_domains do |t|
      t.string :name

      t.timestamps
    end
  end
end
