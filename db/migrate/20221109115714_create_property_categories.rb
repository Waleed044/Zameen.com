# frozen_string_literal: true

class CreatePropertyCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :property_categories do |t|
      t.references :property, null: true, foreign_key: true
      t.references :category, null: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
