class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :post_option
end
