class User < ActiveRecord::Base
  has_secure_password

  validates :email,     presence: true,
                        uniqueness: true,
                        format: /\A[^@]+@[^@]+\z/

  validates :password,  presence: true,
                        confirmation: true,
                        length: {in: 6..64}

end
