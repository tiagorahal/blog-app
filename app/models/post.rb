class Post < ApplicationRecord
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
