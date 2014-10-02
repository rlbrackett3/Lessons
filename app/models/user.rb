class User < ActiveRecord::Base
  has_secure_password
  validates :email,     uniqueness: true,
                        on: :create
  validates :password,  presence: true,
                        on: :create,
                        confirmation: true
end
