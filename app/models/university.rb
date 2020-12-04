class University < ApplicationRecord
  def self.name_search(keyword)
    where('name LIKE ?', "%#{keyword}%")
  end
end
