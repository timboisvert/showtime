class Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true
  validates :text, presence: true
  validates :question_type, presence: true
end
