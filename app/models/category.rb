# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :property_categories
  has_many :properties, through: :property_categories
  # belongs_to :property
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments
end
