class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :post_option
  
  def self.already_voted?(post_id, session_id)
    exists?(post_id: post_id, session_id: session_id)
  end  
end
