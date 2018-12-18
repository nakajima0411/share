class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :gouttes, dependent: :destroy

	def goutted_by?(user)
		gouttes.where(user_id: user.id).exists?
	end

	validates :comments, presence: true
end
