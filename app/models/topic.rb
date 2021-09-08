class Topic < ApplicationRecord
  has_many :users
  has_many :posts

  validates :title, presence: true
end
