require 'rails_helper'

describe UserPolicy, type: :policy do
  subject { described_class }

  let(:target) { build :user }
  let(:user)   { build :user }
  let(:admin)  { build :user, :admin }

  permissions :index? do
    it 'allows admins' do
      expect(subject).to permit(admin, target)
    end

    it 'denies everyone else' do
      expect(subject).to_not permit(target, target)
      expect(subject).to_not permit(user, target)
    end
  end

  permissions :show?, :update?, :edit?, :destroy? do
    it 'allows the user to access themselves' do
      expect(subject).to permit(target, target)
    end

    it 'allows admins' do
      expect(subject).to permit(admin, target)
    end

    it 'denies outsiders' do
      expect(subject).to_not permit(user, target)
    end
  end

  permissions :new?, :create? do
    it 'allows everyone' do
      expect(subject).to permit(target, target)
      expect(subject).to permit(user, target)
      expect(subject).to permit(admin, target)
    end
  end

  describe UserPolicy::Scope do
    it 'gives access to everything for admins'
    it 'only gives access to themselves for users'
  end
end
