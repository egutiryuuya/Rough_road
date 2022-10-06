class CreateGameScores < ActiveRecord::Migration[6.1]
  def change
    create_table :game_scores do |t|
      t.integer :game_title_id,null:false
      t.integer :customer_id,null:false
      t.timestamps
    end
  end
end
