class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nickname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
