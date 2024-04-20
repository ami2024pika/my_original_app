class PostOption < ApplicationRecord
  belongs_to :post
  validates :content, presence: true, if: -> { post.post_options.first(2).include?(self) }
end
