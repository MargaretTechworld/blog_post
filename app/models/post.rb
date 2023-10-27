class Post < ApplicationRecord
  has_many :comments
  belongs_to :author, class_name: 'User'
  has_many :likes
  after_save :update_post_counter

  def update_post_counter
    # author.increment!(:posts_counter)
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
