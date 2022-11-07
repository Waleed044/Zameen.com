# frozen_string_literal: true

class Property < ApplicationRecord
  validates_presence_of :address, :owner, :price, :size, :floors
  # has_one_attached :category
  enum floors: %i[1 2 3 4 5+]
  # enum category: [:sale, :rental]
  belongs_to :user
  has_one_attached :image
  # has_many_attached :image
end
