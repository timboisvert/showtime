class Cast < ApplicationRecord
  belongs_to :production

  def display_name
    "#{name} - #{production.name}"
  end
end
