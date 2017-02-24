class Section < ApplicationRecord

	belongs_to :category
	has_many :listings, :dependent => :destroy

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("name ASC") }
	scope :newest_first, lambda { order("created_at DESC") }

  	validates :name, :presence => true,
					 :length => { :maximum => 255 },
					 :uniqueness => {:scope => :category_id}



end
