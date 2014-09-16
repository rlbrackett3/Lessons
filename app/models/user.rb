class User < ActiveRecord::Base
  has_many :transactions

  has_many :user_addresses
  has_many :addresses, through: :user_addresses
end
