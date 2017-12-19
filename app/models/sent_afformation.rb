class SentAfformation < ActiveRecord::Base
	belongs_to :user
	belongs_to :afformation

	delegate :afformation_text, to: :afformation

end