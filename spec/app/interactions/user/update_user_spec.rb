require 'rails_helper'

describe UpdateUser, type: :interaction do
  let(:user) { create :user }

  describe '#execute' do
    context 'with valid inputs' do
      let(:admin) { create :user, :admin }
      let(:action) do
        UpdateUser.run(
          current_user: admin,
          user: {
            user: user,
            email: 'neiltyson@foo.com'
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in a user' do
        expect(action.result).to be_an_instance_of User
      end

      it 'changes the user\'s email' do
        expect(action.result.email).to eql 'neiltyson@foo.com'
      end
    end

    context 'with invalid inputs' do
      let(:outsider) { create :user }
      let(:action) do
        UpdateUser.run(
          current_user: outsider,
          user: {
            user: user,
            email: 'neiltyson@foo.com',
          }
        )
      end

      it 'is not valid' do
        expect(action.valid?).to_not be_truthy
      end

      it 'results in a user' do
        expect(action.result).to be_an_instance_of User
      end

      it 'does not change the user\'s email' do
        expect(action.result.email).to_not eql 'neiltyson@foo.com'
      end
    end
  end
end
