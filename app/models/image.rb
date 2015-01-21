class Image < ActiveRecord::Base
	
	include Paperclip::Glue

	belongs_to :author
	
	has_attached_file :photo, :styles=> { :thumb=> '100x100>', :medium=> '300x300>' }

	validates_attachment :photo, presence: true,
															 size: { :in => 0..5.megabytes },
															 content_type: {:content_type => ['image/png', 'image/jpg','image/jpeg']}
	
	before_save :change_image_name, :change_image_size

	def change_image_name
		if photo_file_name.present? 
			#debugger
			self.image_name = photo_file_name
		end
	end

	def change_image_size
		if photo_file_size.present? 
			#debugger
			self.image_size = photo_file_size
		end
	end

end
