class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.find_for_github_oauth(auth)
    # where(auth.slice(:provider, :uid)).first_or_create do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # user.provider = auth.provider
      # user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # Notice that Devise's RegistrationsController by default
  # calls "User.new_with_session" before building a resource.
  # This means that, if we need to copy data from session
  # whenever a user is initialized before sign up,
  # we just need to implement new_with_session in our model.
  # Here is an example that copies the facebook email if available:
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
