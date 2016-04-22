require 'rails_helper'

describe Course, type: :model do
  let(:course) { build :course }
  let(:user) { course.user }

  it 'requires a name' do
    expect(course).to validate_presence_of :name
  end

  it 'belongs to a user' do
    expect(course).to belong_to :user
  end
end
