class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 5

  validates :title, presence: true
  validates :body, presence: true

  has_attached_file :image,  styles: {
                                        medium: "300x300",
                                        large: "600x600>"
                                      },
                              default_url: "/images/:style/default.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def post_count
    count
  end
end
