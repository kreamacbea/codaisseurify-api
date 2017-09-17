class Song < ApplicationRecord
  belongs_to :artist

  scope :order_by_name, -> { order(:name) }

  validates :title, presence: true, uniqueness: true
end
