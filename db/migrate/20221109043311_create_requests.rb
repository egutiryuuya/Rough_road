class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.text :title
      t.text :reason
      t.timestamps
    end
  end
end
