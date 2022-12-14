# frozen_string_literal: true

class UserInfoController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
  end
end
