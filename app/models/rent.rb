class Rent < ApplicationRecord
  belongs_to :user, :book, required: true
  validates :user, :book, :from, :to, presence: true
end
