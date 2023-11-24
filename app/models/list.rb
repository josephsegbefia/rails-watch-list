class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 10}
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
end
