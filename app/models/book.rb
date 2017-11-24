class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  validates :genre, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
end
