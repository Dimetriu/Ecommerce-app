class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :confirmable,
         :omniauthable, omniauth_providers: [:facebook]

  # Omniauth
  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
        user.email          = auth.info.email
        user.password       = Devise.friendly_token[0, 20]
        user.first_name     = auth.info.first_name
        user.image          = auth.info.image

        user.skip_confirmation!
      end

      def new_with_session(params, session)
        super.tap do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
          end
        end
      end
    end
  end
end
