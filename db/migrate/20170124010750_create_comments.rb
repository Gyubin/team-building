class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :writer
      t.string :content
      t.integer :project_id
      
      t.timestamps null: false
    end
  end
end
