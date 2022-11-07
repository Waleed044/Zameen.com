# frozen_string_literal: true

class AddTypeToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :type, :string
  end
end
