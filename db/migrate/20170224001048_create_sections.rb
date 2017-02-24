class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
	  t.integer "category_id"
	  t.string "name"
	  t.boolean "visible", :default => false	    	
      t.timestamps
    end
    add_index("sections", "category_id")
  end
end
