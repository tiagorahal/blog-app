class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  has_many :comments
  has_many :likes

<<<<<<< HEAD
  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: '%<count> characters is the maximum allowed' }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

=======
>>>>>>> d1e3747a0516858e8857cb99d26adfeb8218ac8d
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    posts_counter = user.posts.count
    user.update(posts_count: posts_counter)
  end
end
