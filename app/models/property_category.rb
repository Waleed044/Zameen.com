# frozen_string_literal: true

class PropertyCategory < ApplicationRecord
  belongs_to :property
  belongs_to :category
end
