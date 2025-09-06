class AuditionRequest < ApplicationRecord
  belongs_to :call_to_audition
  belongs_to :person
  has_many :answers, dependent: :destroy

  enum :status, {
    unreviewed: 0,
    undecided: 1,
    passed: 2,
    accepted: 3
  }

  def display_name
    person.stage_name
  end

  def next
    call_to_audition.audition_requests.where("created_at > ?", created_at).order(created_at: :asc).first
  end

  def previous
    call_to_audition.audition_requests.where("created_at < ?", created_at).order(created_at: :desc).first
  end
end
