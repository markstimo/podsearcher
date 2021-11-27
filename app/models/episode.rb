class Episode < ApplicationRecord
	#validators
	validates :title, presence: true

	has_many :topics, dependent: :destroy
end
