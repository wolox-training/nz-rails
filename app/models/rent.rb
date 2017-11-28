class Rent < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :book, required: true
  validates :user, :book, :from, :to, presence: true
end
