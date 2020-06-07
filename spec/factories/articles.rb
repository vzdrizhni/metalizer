# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    author_id { 1 }
    title { 'MyString' }
    text { 'MyText' }
    image { 'MyString' }
  end
end
