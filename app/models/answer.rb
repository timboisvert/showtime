class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :call_to_audition

  validates :question, presence: true
end
