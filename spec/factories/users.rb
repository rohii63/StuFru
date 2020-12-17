FactoryBot.define do
  factory :user do
    name { 'spec' }
    sequence(:email) { |n| "spec#{n}@example.com" }
    password { 'password' }
    confirmed_at { DateTime.now }
    confirmation_sent_at { DateTime.now }
  end
end
