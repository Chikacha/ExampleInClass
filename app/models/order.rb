class Order < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 200 }
  
  validates :phone, presence: true
  has_many :comments
  has_many :votes, as: :voteable
  def up_votes
    self.votes.where(vote: true).length
  end

  def down_votes
    self.votes.where(vote: false).length
  end

  def total_votes
    up_votes - down_votes
  end

end
