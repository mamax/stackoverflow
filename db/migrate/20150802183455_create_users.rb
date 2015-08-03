class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :date_of_birth
      t.string :country
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
