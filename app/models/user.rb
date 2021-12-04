class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :photo, :posts_counter, presence: true
  validates :name, :photo, :bio, length: { minimum: 4 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :comments
  has_many :posts
  has_many :likes

  def show_recent
    posts.order(created_at: :desc).limit(3)
  end
end
