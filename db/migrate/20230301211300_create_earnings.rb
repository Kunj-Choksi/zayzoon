class CreateEarnings < ActiveRecord::Migration[7.0]
  def change
    create_table :earnings do |t|
      t.date :earning_date, :null =>  false
      t.decimal :amount, precision: 2, :null =>  false
      t.references :employee, :null =>  false

      t.timestamps
    end
  end
end
