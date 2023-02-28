class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :employer
      t.date :date_started
      t.date :date_employment_ended

      t.timestamps
    end
  end
end
