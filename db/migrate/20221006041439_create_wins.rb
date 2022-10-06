class CreateWins < ActiveRecord::Migration[6.1]
  def change
    create_table :wins do |t|
      t.integer :customer_id
      t.integer :win_reason_
      t.timestamps
    end
  end
end
