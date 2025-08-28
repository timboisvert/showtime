class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :audition_request

  validates :question, presence: true
end
