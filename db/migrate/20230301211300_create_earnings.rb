class CreateEarnings < ActiveRecord::Migration[7.0]
  def change
    create_table :earnings do |t|
      t.string :employee_external_ref
      t.date :earning_date
      t.float :amount
      t.references :employee

      t.timestamps
    end
  end
end
