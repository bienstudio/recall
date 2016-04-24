require 'rails_helper'

describe Task, type: :model do
  let(:task) { build :task }

  it 'belongs to a user' do
    expect(task).to belong_to :user
  end

  it 'belongs to a course' do
    expect(task).to belong_to :course
  end

  it 'belongs to a project' do
    expect(task).to belong_to :project
  end
end
