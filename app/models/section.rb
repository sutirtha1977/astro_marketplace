class Section < ApplicationRecord

	belongs_to :category
	has_many :listings

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("name ASC") }
	scope :newest_first, lambda { order("created_at DESC") }

end
