# frozen_string_literal: true

class RemoveUserIdFromProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :user_id
  end
end
