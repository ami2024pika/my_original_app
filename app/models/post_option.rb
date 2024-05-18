class PostOption < ApplicationRecord
  belongs_to :post
  has_many :votes, dependent: :destroy
  # validates :content, presence: true, if: -> { post.post_options.first(2).include?(self) }
  
  validate :validate_content_for_first_two

  private

  def validate_content_for_first_two
    if post.present? && first_two_post_options_include_self? && content.blank?
      errors.add(:content, "can't be blank for the first two post options")
    end
  end

  def first_two_post_options_include_self?
    post.post_options.first(2).include?(self)
  end
end
