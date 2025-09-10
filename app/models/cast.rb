class Cast < ApplicationRecord
  belongs_to :production
  has_and_belongs_to_many :people

  validates :name, presence: true
end
