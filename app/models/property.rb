# frozen_string_literal: true
class Property < ApplicationRecord
  validates_presence_of :address, :owner, :price, :size, :floors
  # has_one_attached :category
  enum floors: %i[1 2 3 4 5+]
  enum property_type: %i[sale rental]
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  has_many :attachments, as: :attachable
  # has_many_attached :image
  has_many :property_categories
  has_many :categories, through: :property_categories, dependent: :destroy
  scope :searched, ->(owner) { where('owner LIKE ?', "%#{owner}%") }
  has_many :queries
end
