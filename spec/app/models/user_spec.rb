require 'rails_helper'

describe User, type: :model do
  let(:user) { build :user }

  it 'requires an email' do
    expect(user).to validate_presence_of :email
  end

  it 'requires a unique email' do
    expect(user).to validate_uniqueness_of :email
  end

  it 'has a role' do
    expect(user).to define_enum_for :role
  end

  it 'has many courses' do
    expect(user).to have_many :courses
  end

  it 'has many projects' do
    expect(user).to have_many :projects
  end

  it 'has many tasks' do
    expect(user).to have_many :tasks
  end
end
