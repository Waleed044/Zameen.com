# frozen_string_literal: true

class Query < ApplicationRecord
    belongs_to :property
    belongs_to :user
end
