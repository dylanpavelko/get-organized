class User < ActiveRecord::Base
	attr_accessor :password
	require 'bcrypt'

	EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create
	has_many :roles, class_name: "Role"


	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
	  if password.present?
	    self.salt = BCrypt::Engine.generate_salt
	    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
	  end
	end

	def clear_password
	  self.password = nil
	end
	
	def person_id
		return Person.where(:user_account_id => self.id).first.id
	end

	def person
		return Person.where(:user_account_id => self.id).first
	end

	def self.authenticate(username_or_email="", login_password="")
	  if  EMAIL_REGEX.match(username_or_email)    
	    user = User.find_by_email(username_or_email)
	  else
	    user = User.find_by_username(username_or_email)
	  end
	  if user && user.match_password(login_password)
	    return user
	  else
	    return false
	  end
	end   

	def match_password(login_password="")
	  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
	end


	def picture
		# get the email from URL-parameters or what have you and make lowercase
		email_address = self.email.downcase
 
		# create the md5 hash
		hash = Digest::MD5.hexdigest(email_address)
 
		# compile URL which can be used in <img src="RIGHT_HERE"...
		image_src = "https://www.gravatar.com/avatar/#{hash}"

		return image_src
	end
	
	def roles
		@hasRoles = UserHasRole.where(:user_id => self.id)
		@roles = Array.new
		@hasRoles.each do |has|
			@roles << has.role
		end
		return @roles
	end
	
	def has_access_to_path(requested_controller, requested_action, id)
		@security_domain = Task.where(:controller => requested_controller, :action => requested_action)
		if @security_domain.count > 0
			@security_domain = @security_domain.first.security_domain 	#for now should always just be 1, because tasks are tied to a domain
		end
		self.roles.each do |role|
			if SecurityDomainHasRole.where(:domain_id => @security_domain,
				:role_id => role).count >0
				if requested_controller == 'trips' and requested_action == 'show'
					#check to see if user is owner or particpant to trip
					@trips = Trip.get_my_trips(self)
					if @trips.include? Trip.find(id.to_i)
						return true
					else
						return false
					end
				elsif requested_controller == 'itinerary_activities' and requested_action == 'show'
					@trips = Trip.get_my_trips(self)
					@activity = ItineraryActivity.where(:id => id).first
					puts @activity.trip.name
					if @trips.include? Trip.find(@activity.trip_id)
						return true
					else
						return false
					end
				elsif requested_controller == 'inventory_items' and requested_action == 'show'
					@inventory_item = InventoryItem.find(id)
					@allMyItems = InventoryItem.get_all_public_and_my_items(self)
					if @allMyItems.include?(@inventory_item) or self.has_access_to_path("public_inventory_item_queue" , "index", nil)
						return true
					else
						return false
					end
				elsif requested_controller == 'inventory_items' and requested_action == 'edit'
					@inventory_item = InventoryItem.find(id)
					@allMyItems = InventoryItem.get_all_public_and_my_items(self)
					if ((@inventory_item.public != true) and @allMyItems.include?(@inventory_item)) or self.has_access_to_path("public_inventory_item_queue" , "index", nil)
						return true
					else
						return false
					end
				else
					return true
				end

			end
		end
		return false
	end

end
