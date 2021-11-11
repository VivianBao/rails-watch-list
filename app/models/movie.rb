class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true
  validates :title, presence: true, null: false
  validates :overview, presence: true, null: false
end
