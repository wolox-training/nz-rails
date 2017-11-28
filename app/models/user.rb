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
    User.find_by(email: data['email'])

    User.create(first_name: data['first_name'],
                last_name: data['last_name'],
                email: data['email'],
                password: '123123123',
                password_confirmation: '123123123',
                locale: 'es')
  end
end
