class CreateSecurityDomainHasRoles < ActiveRecord::Migration
  def change
    create_table :security_domain_has_roles do |t|
      t.references :domain, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
