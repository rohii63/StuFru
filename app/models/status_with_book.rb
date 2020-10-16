class StatusWithBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_category

  enum status: { "勉強中": 0, "勉強予定": 1, "勉強済み": 2 }
  enum study_unit: { "時間": 0, "ページ": 1, "単語": 2, "問": 3 }
end
