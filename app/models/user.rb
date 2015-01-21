class User < ActiveRecord::Base

	validates :f_name, presence: true, uniqueness: true, length: 0..30
	validates :l_name, presence: true, uniqueness: true, length: 0..30
	validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , on: :create}
	validates :address, presence: true
	validates :password, presence: true, confirmation: true

	
	before_save :encrypt_password

	def self.authenticate(email,password)
		if email && password
			if User.find_by_email_and_password(email, Digest::MD5.hexdigest(password))
				user = User.find_by_email_and_password(email, Digest::MD5.hexdigest(password))
			else
				nil
			end
		end
	end


	def encrypt_password
		#debugger
	if password
		self.password = Digest::MD5.hexdigest(password)
	end
	end

	#log=Logger.new("#{Rails.root}/log/call_backs.log")
	 # before_save do |user|
	  #log.info("#{Array(user)}")
	  #log.info("#{user.f_name}")
	#end

	# after_initialize do |user|
	# 	puts "Object got initialize properly"
 #  end
end
