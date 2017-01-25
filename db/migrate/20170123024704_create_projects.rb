class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :content
      t.string :picture
      t.integer :online
      t.integer :writer
       
      t.timestamps null: false
    end
  end
end
