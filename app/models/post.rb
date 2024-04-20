class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :post_options
  accepts_nested_attributes_for :post_options, allow_destroy: true
  validates :title, :content, presence: true
end
