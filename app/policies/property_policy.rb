# frozen_string_literal: true

class PropertyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.role == 'buyer' || user.role == 'seller' if user.present?
  end

  def new?
    user.role == 'seller'
  end

  def create?
    user.role == 'seller'
  end

  def edit?
    user.role == 'seller'
  end

  def update?
    user.role == 'seller'
  end

  def destroy?
    user.role == 'seller'
  end
end
