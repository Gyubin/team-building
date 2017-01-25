class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
       
      t.integer :send_id
      t.integer :recv_id
      t.string :content

      t.timestamps null: false
    end
  end
end
