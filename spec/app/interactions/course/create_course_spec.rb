require 'rails_helper'

describe CreateCourse, type: :interaction do
  describe '#to_model' do
    it 'returns an empty course' do
      expect(CreateCourse.new.to_model).to be_an_instance_of Course
    end
  end

  describe '#execute' do
    let(:user) { build :user }

    context 'with valid inputs' do
      let(:action) do
        CreateCourse.run(
          current_user: user,
          course: {
            name: 'Intro to Programming',
            code: 'CMPT101N',
            color: '#FFF'
          }
        )
      end

      it 'is valid' do
        expect(action.valid?).to be_truthy
      end

      it 'results in a course' do
        expect(action.result).to be_an_instance_of Course
      end
    end

    context 'with invalid inputs' do
      let(:action) do
        CreateCourse.run
      end

      it 'is not valid' do
        expect(action.valid?).to be_falsey
      end

      it 'has errors' do
        expect(action.errors).to_not be_nil
      end
    end
  end
end
