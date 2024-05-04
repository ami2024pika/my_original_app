class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :post_options, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :post_options, reject_if: proc { |attributes| attributes['content'].blank? }, allow_destroy: true
  validates :title, :content, presence: true
end
