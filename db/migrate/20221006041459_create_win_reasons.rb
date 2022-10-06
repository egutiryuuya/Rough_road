class CreateWinReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :win_reasons do |t|
      t.string :reason
      t.integer :game_score_id,null:false
      t.timestamps
    end
  end
end
