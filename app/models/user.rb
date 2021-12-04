class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

<<<<<<< HEAD
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

=======
>>>>>>> d1e3747a0516858e8857cb99d26adfeb8218ac8d
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
