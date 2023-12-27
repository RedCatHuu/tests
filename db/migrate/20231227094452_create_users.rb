class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :introduction
      t.integer :year
      t.integer :month
      t.integer :day
      t.string :sex

      t.timestamps
    end
  end
end
