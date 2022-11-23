# frozen_string_literal: true

class UserInfoController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end
end
