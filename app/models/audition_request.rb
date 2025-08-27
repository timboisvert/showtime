class AuditionRequest < ApplicationRecord
  belongs_to :call_to_audition
  belongs_to :person

  enum :status, {
    unreviewed: 0,
    undecided: 1,
    passed: 2,
    accepted: 3
  }

  def display_name
    person.stage_name
  end
end
