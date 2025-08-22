class AuditionSession < ApplicationRecord
  belongs_to :call_to_audition

  def display_name
    "#{call_to_audition.production_name} - #{date_and_time.strftime("%-m/%-d/%Y %l:%M %p")}"
  end
end
