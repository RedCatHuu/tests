class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
