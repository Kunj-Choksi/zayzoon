class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :external_ref
      t.references :employer

      t.timestamps
    end
  end
end
