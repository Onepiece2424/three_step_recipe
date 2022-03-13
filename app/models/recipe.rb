class Recipe < ApplicationRecord
  has_many_attached :images
  belongs_to :user, optional: true
  has_many :comments
end
