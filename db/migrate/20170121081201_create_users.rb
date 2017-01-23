class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :university
      t.string :major
      t.string :email
      t.boolean :isMale
      t.text :introduction
       t.timestamps null: false
    end
  end
end
