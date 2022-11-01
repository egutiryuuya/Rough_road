class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :title
      t.text :body
      t.boolean "is_settled",default: false
      t.integer :customer_id
      t.decimal "score", precision: 5, scale: 3
      t.timestamps
    end
  end
end
