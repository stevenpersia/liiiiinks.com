class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :name
      t.string :link
      t.string :category_id
      t.text :textlink
      t.timestamps
    end
  end
end
