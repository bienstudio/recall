require 'rails_helper'

describe User, type: :model do
  let(:user) { build :user }

  it 'requires an email' do
    expect(user).to validate_presence_of :email
  end

  it 'has many subjects' do
    expect(user).to have_many :subjects
  end
end
