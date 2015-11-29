class Picture < ActiveRecord::Base

	has_attached_file :image,
					:url => "/assets/pictures/:id/:basename.:extension",
					:path => ":rails_root/public/assets/pictures/:id/:basename.:extension"

	validates_attachment :image, :size => { :in => 0..1000.kilobytes }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
