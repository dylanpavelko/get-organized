class CreateTaskHasSecurityDomains < ActiveRecord::Migration
  def change
    create_table :task_has_security_domains do |t|
      t.references :task, index: true
      t.references :security_domain, index: true

      t.timestamps
    end
  end
end
