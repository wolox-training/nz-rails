class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  has_many :rents, dependent: :destroy

  def name
    email
  end
end
