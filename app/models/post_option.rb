class PostOption < ApplicationRecord
  belongs_to :post
  has_many :votes, dependent: :destroy
  validates :content, presence: true, if: -> { post.post_options.first(2).include?(self) }
end
