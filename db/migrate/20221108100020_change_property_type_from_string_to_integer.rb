# frozen_string_literal: true

class ChangePropertyTypeFromStringToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :property_type, :integer, using: 'property_type::integer'
  end
end
