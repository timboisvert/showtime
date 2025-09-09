class AuditionSession < ApplicationRecord
  belongs_to :production

  def display_name
    "#{production.name} - #{date_and_time.strftime("%-m/%-d/%Y %l:%M %p")}"
  end
end
