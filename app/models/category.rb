# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :articles, through: :tags

  validates :name, presence: true, length: { in: 3..20 }, uniqueness: true
end
