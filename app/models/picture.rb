class Picture < ActiveRecord::Base

	has_attached_file :image,
					:url => "/assets/pictures/:id/:basename.:extension",
					:path => ":rails_root/public/assets/pictures/:id/:basename.:extension",
					#:styles {
 				    #:thumb ["40x40#", :png],
				    #:small ["400x400>", :png]},
				    #default_url: "#{Rails.root}/app/assets/images/missing.jpg",
				    :storage => :s3,
				    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
				    :url => ":s3_domain_url"
#    path: ":rails_root/public/assets/pictures/:id/:basename.:extension"

    		
  def s3_credentials
    {:bucket => 'get-organized-assets', :access_key_id => 'AKIAIJG6LK3XW5RZ22VA'}
  end

	validates_attachment :image, :size => { :in => 0..1000.kilobytes }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
