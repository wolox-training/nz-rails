class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  has_many :rents, dependent: :destroy

  def name
    email
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])
    if user.nil?
      User.create_new_user(data)
    else
      user
    end
  end

  def self.create_new_user(data)
    pass = Devise.friendly_token
    User.create(first_name: data['first_name'],
                last_name: data['last_name'],
                email: data['email'],
                password: pass,
                password_confirmation: pass,
                locale: 'es')
  end
end
