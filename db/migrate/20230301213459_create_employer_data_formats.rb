class CreateEmployerDataFormats < ActiveRecord::Migration[7.0]
  def change
    create_table :employer_data_formats do |t|
      t.json :fields
      t.references :employer

      t.timestamps
    end
  end
end
