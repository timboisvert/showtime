class CallToAudition < ApplicationRecord
  belongs_to :production
  has_many :audition_requests, dependent: :destroy
  has_many :audition_sessions, dependent: :destroy
  has_many :questions, as: :questionable, dependent: :destroy

  validates :opens_at, presence: true
  validates :closes_at, presence: true

  def production_name
    self.production.name
  end

  def counts
    {
      unreviewed: self.audition_requests.where(status: :unreviewed).count,
      undecided: self.audition_requests.where(status: :undecided).count,
      passed: self.audition_requests.where(status: :passed).count,
      accepted: self.audition_requests.where(status: :accepted).count
    }
  end

  def timeline_status
    if self.opens_at > Time.current
      :upcoming
    elsif self.closes_at <= Time.current
      :closed
    else
      :open
    end
  end

  def respond_url
    if Rails.env.development?
      "http://localhost:3000" + Rails.application.routes.url_helpers.respond_to_call_to_audition_path(self.hex_code)
    else
      "https://www.cocoscout.com" + Rails.application.routes.url_helpers.respond_to_call_to_audition_path(self.hex_code)
    end
  end
end
