class Role < ApplicationRecord
  has_many :users, through: :user_roles
  validates :authority_name, presence: true
end
