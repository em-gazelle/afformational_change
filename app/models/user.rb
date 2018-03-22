class User < ApplicationRecord
	include AfformationEnumMappings

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	# devise :database_authenticatable, :async, :registerable,
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	
	has_many :afformations, through: :sent_afformations
	# optional, user submitted only
	has_many :afformations
	
	validates_presence_of :email #, :name
	after_validation :assign_general_if_no_or_all_focus_areas_selected
	after_create :send_welcome_email


	def send_welcome_email
		UserMailer.welcome_email(self.email).deliver_now
	end

	private 

	def assign_general_if_no_or_all_focus_areas_selected
		if personal_afformation_focus_area.blank? || (personal_afformation_focus_area.size == (User.afformation_enum_mappings.size-1))
			self.personal_afformation_focus_area = ["general"]
		end
	end
end
