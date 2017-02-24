class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer "section_id"
      t.string "name"
      t.boolean "visible", :default => false
      t.text "description"
      t.decimal "price"	
      t.timestamps
    end
    add_index("listings", "section_id")
  end
end
