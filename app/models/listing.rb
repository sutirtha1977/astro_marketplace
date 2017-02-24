class Listing < ApplicationRecord

	belongs_to :section

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("name ASC") }
	scope :newest_first, lambda { order("created_at DESC") }

  	validates :name, :presence => true,
					 :length => { :maximum => 255 },
					 :uniqueness => {:scope => :section_id}
  	validates_presence_of :description
	
end
