class CreateReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :reasons do |t|
      t.string :title ,null:false
      t.integer :game_score_id,null:false
      t.integer :status, default:0, null:false
      t.timestamps
    end
  end
end
