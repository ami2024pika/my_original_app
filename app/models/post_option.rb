class PostOption < ApplicationRecord
  belongs_to :post
  has_many :votes, dependent: :destroy
end
