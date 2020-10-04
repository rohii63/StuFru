class University < ApplicationRecord
  def self.name_search(keyword)
    self.where('name LIKE ?', "%#{keyword}%")
  end
end
