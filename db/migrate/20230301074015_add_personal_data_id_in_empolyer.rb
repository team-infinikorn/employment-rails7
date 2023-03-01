class AddPersonalDataIdInEmpolyer < ActiveRecord::Migration[7.0]
  def change
    add_reference :personal_data, :employers
  end
end
