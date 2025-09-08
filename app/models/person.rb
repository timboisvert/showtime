class Person < ApplicationRecord
  has_one_attached :resume, dependent: :purge_later
  has_one_attached :headshot, dependent: :purge_later
  has_many :audition_requests, dependent: :destroy

  validates :stage_name, presence: true
  validates :email, presence: true
  validates :resume, content_type: %w[application/pdf image/jpeg image/png]
  validates :headshot, content_type: %w[image/jpeg image/png]
end
