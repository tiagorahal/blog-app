class Post < ApplicationRecord
  validates :title, :text, :comments_counter, :likes_counter, presence: true
  validates :text, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  has_many :comments
  has_many :likes
  belongs_to :user
  after_save :update_counter

  def show_recent
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    user.increment!(:posts_counter)
  end
end
