class StatusWithBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_category
end
