class StatusWithBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_category

  enum status: { "勉強中": "in_progress", "勉強予定": "standby", "勉強済み": "finished" }
  enum study_unit: { "時間": "hour", "ページ": "page", "単語": "word", "問": "question" }
end
