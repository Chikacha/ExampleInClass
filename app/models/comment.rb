class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :votes, as: :voteable
end