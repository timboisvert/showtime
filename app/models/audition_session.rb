class AuditionSession < ApplicationRecord
  belongs_to :production
  has_and_belongs_to_many :auditions

  def display_name
    "#{production.name} - #{date_and_time.strftime("%-m/%-d/%Y %l:%M %p")}"
  end
end
