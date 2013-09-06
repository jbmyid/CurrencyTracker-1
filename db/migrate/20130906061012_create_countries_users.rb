class CreateCountriesUsers < ActiveRecord::Migration
  def change
    create_table :countries_users do |t|
      t.references :user
      t.string :country_id

      t.timestamps
    end
    add_index :countries_users, :user_id
    add_index :countries_users, :country_id
  end
end
