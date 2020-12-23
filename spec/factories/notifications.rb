FactoryBot.define do
  factory :notification do
    action { 'follow' }
    visited_id { 1 }
    visitor_id { 1 }
  end
end
