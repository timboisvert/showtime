class Role < ApplicationRecord
  belongs_to :production
  validates :name, presence: true
end
