class AddPersonalDataIdInEmpolyer < ActiveRecord::Migration[7.0]
  def change
    add_reference :employers, :personal_datum, foreign_key: { to_table: :personal_data }
  end
end
