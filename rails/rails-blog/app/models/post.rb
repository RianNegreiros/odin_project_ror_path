class Post < ApplicationRecord
  include PgSearch

  validates :title, :author, :body, presence: true

  has_many :comments, dependent: :destroy

  pg_search_scope :search, against: %i[title author body], associated_against: { comments: %i[body] }
end
