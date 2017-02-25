class AddPaperclipToListing < ActiveRecord::Migration[5.0]
  def up
  	add_attachment :listings, :image
  end

  def down
  	remove_attachment :listings, :image
  end
end
