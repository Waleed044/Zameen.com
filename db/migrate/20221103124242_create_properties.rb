# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :address
      t.integer :size
      t.integer :price
      t.integer :floors
      t.string :owner
      t.integer :year_built
      t.string :image
      t.timestamps
    end
  end
end
