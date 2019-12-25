class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :type
      t.string :notes
      t.references :user, null: false, foreign_key: true
      t.text :ingredients , null: false
      t.text :directions , null: false
      t.string :image 
      t.timestamps
    end
  end
end
