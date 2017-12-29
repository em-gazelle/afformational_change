class SentAfformation < ActiveRecord::Base
	belongs_to :user
	belongs_to :afformation

	scope :unanswered_first, -> { order(user_response_to_afformation: :desc) }

	delegate :afformation_text, to: :afformation

	validates :user_response_to_afformation, presence: :true, on: :update

end