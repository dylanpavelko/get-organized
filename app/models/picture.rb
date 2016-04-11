class Picture < ActiveRecord::Base

	has_attached_file :image,
					:url => "/assets/pictures/:id/:basename.:extension",
					:path => ":rails_root/public/assets/pictures/:id/:basename.:extension",
					#:styles {
 				    #:thumb ["40x40#", :png],
				    #:small ["400x400>", :png]},
				    #default_url: "#{Rails.root}/app/assets/images/missing.jpg",
				    :storage => :s3,
				    :bucket => 'get-organized-assets',
				    :s3_credentials => "#{Rails.root}/config/application.yml"
#    path: ":rails_root/public/assets/pictures/:id/:basename.:extension"

    				
	validates_attachment :image, :size => { :in => 0..1000.kilobytes }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
