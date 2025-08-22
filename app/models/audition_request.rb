class AuditionRequest < ApplicationRecord
  belongs_to :call_to_audition
  belongs_to :person

  def display_name
    person.stage_name
  end
end
