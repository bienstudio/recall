require 'rails_helper'

describe CoursePolicy, type: :policy do
  subject { described_class }

  let(:target)   { build :course }
  let(:owner)    { target.user }
  let(:outsider) { build :user }
  let(:admin)    { build :user, :admin }

  permissions :index?, :new?, :create? do
    it 'allows anyone' do
      expect(subject).to permit(owner, target)
      expect(subject).to permit(outsider, target)
      expect(subject).to permit(admin, target)
    end
  end

  permissions :show?, :update?, :edit?, :destroy? do
    it 'allows the user to their own course' do
      expect(subject).to permit(owner, target)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, target)
    end

    it 'denies outsiders' do
      expect(subject).to_not permit(outsider, target)
    end
  end

  describe CoursePolicy::Scope do
    it 'gives access to everything for admins'
    it 'only gives access to themselves for users'
  end
end
