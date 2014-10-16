class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates :password,  presence: true,
                        on: :create,
                        confirmation: true
end
