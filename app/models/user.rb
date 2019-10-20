class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_person_name

  has_many :posts, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    # Uncomment the section below if you want users to be created if they don't exist
    if user.blank?
      user = User.create(
        name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20],
        confirmed_at: Time.now
      )
    end

    user
  end
end
