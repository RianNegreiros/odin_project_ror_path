class Link < ApplicationRecord
<<<<<<< HEAD
=======
  belongs_to :user
  acts_as_votable
  has_many :comments
>>>>>>> project_reddit_clone
end
