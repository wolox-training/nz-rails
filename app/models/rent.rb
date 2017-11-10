class Rent < ApplicationRecord
  validates :user_id, presence true
  validates :book_id, presence true
  validates :from, presence true
  validates :to, presence true
end
