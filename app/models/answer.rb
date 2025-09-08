class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :audition_request

  validates :question, presence: true

  def value_as_array
    if [ "multiple-multiple", "multiple-single" ].include?(question.question_type)
      begin
        parsed_value = JSON.parse(value.gsub("=>", ":"))
        parsed_value.keys
      rescue JSON::ParserError
        [] # If parsing fails, return an empty array
      end
    else
      # For text and yesno types, just return the raw value
      [ value ]
    end
  end
end
