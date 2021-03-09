class Comment < ApplicationRecord
	belongs_to :user

	# belongs_to :targetable
	validates :content, presence: true

	#this is rely_coment working station - start
	belongs_to :targetable, polymorphic: true
	has_many :subcomments, class_name: "Comment", foreign_key: "targetable_id"
	#this is rely_coment working station - end

	# This is reply_comment working by delegate
		delegate :name, to: :user, prefix: :user
	# This is reply_comment working by delegate



	scope :orderByDesc, -> { order(created_at: :desc) }
end
