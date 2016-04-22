class UserPolicy < ApplicationPolicy
  def index?
    @user.admin?
  end

  def show?
    @user == @record || @user.admin?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    show?
  end

  def edit?
    show?
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(id: @user.id)
      end
    end
  end
end
