require 'rails_helper'

describe Subject, type: :model do
  let(:subject) { build :subject }

  it 'belongs to a user' do
    expect(subject).to belong_to :user
  end
end
