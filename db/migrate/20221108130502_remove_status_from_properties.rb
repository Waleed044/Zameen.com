# frozen_string_literal: true

class RemoveStatusFromProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :status
  end
end
