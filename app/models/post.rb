class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 5

  validates :title, presence: true
  validates :body, presence: true
end
