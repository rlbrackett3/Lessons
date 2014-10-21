class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates :password,  presence: true,
                        on: :create,
                        confirmation: true

  has_attached_file :avatar,  styles: {
                                        medium: "300x300",
                                        thumb: "100x100>"
                                      },
                              default_url: "/images/:style/default.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
