class Category < ApplicationRecord
	has_many :products
		
		validates :name, presence: true,
    	length: { minimum: 5 }

		has_attached_file :image, styles: {big: ["535x300#", :jpeg], small: ["100x100#", :jpeg], original: [:jpeg]}
			
			validates_attachment :image,
        	content_type: { content_type: /\Aimage\/.*\z/ },
        	size: { less_than: 6.megabyte }
				
				validates :name, presence: true,
    			length: { minimum: 5 }
end
