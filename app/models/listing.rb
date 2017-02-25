class Listing < ApplicationRecord
  	has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "no_image.jpeg"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	belongs_to :section

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("name ASC") }
	scope :newest_first, lambda { order("created_at DESC") }

  	validates :name, :presence => true,
					 :length => { :maximum => 255 },
					 :uniqueness => {:scope => :section_id}
  	validates_presence_of :description
  	validates_attachment_presence :image
	
end
