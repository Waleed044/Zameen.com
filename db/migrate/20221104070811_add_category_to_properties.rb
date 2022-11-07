# frozen_string_literal: true

class AddCategoryToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :category, :string
  end
end
