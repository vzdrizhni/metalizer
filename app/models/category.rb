class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :articles, through: :tags
end
