class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    @user == @record.user || @user.admin?
  end

  def create?
    index?
  end

  def new?
    index?
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
        scope.where(user_id: @user.id)
      end
    end
  end
end
