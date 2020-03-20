class CreateBrochures < ActiveRecord::Migration[5.1]
  def change
    create_table :brochures do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :keywords
      t.string :src
      t.string :owner_type
      t.integer :user_id

      t.timestamps
    end
  end
end
