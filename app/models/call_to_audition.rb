class CallToAudition < ApplicationRecord
  belongs_to :production
  has_many :audition_requests, dependent: :destroy
  has_many :audition_sessions, dependent: :destroy
  has_many :questions, as: :questionable, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :opens_at, presence: true
  validates :closes_at, presence: true

  def production_name
    self.production.name
  end
end
