class User < ActiveRecord::Base
  has_secure_password

  # Associations

  # Validations
  validates :email,     presence: true,
                        email: true
  validates :password,  presence: true, 
                        confirmation: true
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end