class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.string :title
      t.text :description
      t.text :description_long
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
