class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	include AfformationEnum

	has_many :afformations, through: :sent_afformations

	# optional, user submitted only
	has_many :afformations
	
	validates_presence_of :email, :name	
end
