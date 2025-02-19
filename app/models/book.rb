class Book < ApplicationRecord
  has_many :lendings, dependent: :destroy

  validates :title, :author, :isbn, presence: { message: "can't be blank" }
  validates :isbn, uniqueness: { message: "already exists" }
  validates :isbn, format: { with: /\A(\d{10}|\d{13})\z/, message: "must be 10 or 13 digits" }
end
