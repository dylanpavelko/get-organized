class Picture < ActiveRecord::Base

	has_one_attached :image

    		
  def s3_credentials
    {:bucket => 'get-organized-assets', :access_key_id => 'AKIAIJG6LK3XW5RZ22VA', :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end

	validates_attachment :image, :size => { :in => 0..1000.kilobytes }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
