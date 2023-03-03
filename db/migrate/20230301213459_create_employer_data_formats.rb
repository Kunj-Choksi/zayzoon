class CreateEmployerDataFormats < ActiveRecord::Migration[7.0]
  def change
    create_table :employer_data_formats do |t|
      t.string :employee_id
      t.string :earning_date
      t.string :earning_amount
      t.references :employer

      t.timestamps
    end
  end
end
