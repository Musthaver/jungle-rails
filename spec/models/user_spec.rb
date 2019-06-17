require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:first_name) {'Bob'}
    let(:last_name) {'TheBuilder'}
    let(:email) {'test@test.com'}
    let(:password) {'password'}
    let(:password_confirmation) {'password'}

    let(:user) {User.new(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation)}
    let(:user2) {User.new(first_name: first_name, last_name: last_name, email: 'TEST@TEST.com', password: password, password_confirmation: password_confirmation)}
    let(:user3) {User.new(first_name: first_name, last_name: last_name, email: 'test2@test.com', password: 'hello', password_confirmation: 'hello')}

    context 'when all the proper attributes are provided' do
      it 'should be valid' do
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'when user first name is not present' do

      it 'should not be valid' do
        user.first_name = nil
        expect(user).to_not be_valid
      end

      it 'reports a validation error on the first name' do
        user.first_name = nil
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

    end

    context 'when user last name is not present' do

      it 'should not be valid' do
        user.last_name = nil
        expect(user).to_not be_valid
      end

      it 'reports a validation error on the last name' do
        user.last_name = nil
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

    end

    context 'when user password is not present' do

      it 'should not be valid' do
        user.password = nil
        expect(user).to_not be_valid
      end

      it 'reports a validation error on the password' do
        user.password = nil
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

    end

    context 'when user password is not present' do

      it 'should not be valid' do
        user.password = nil
        expect(user).to_not be_valid
      end

      it 'reports a validation error on the password' do
        user.password = nil
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

    end

    context 'when user password confirmation is not present' do

      it 'should not be valid' do
        user.password_confirmation = ''
        expect(user).to_not be_valid
      end

      it 'reports a validation error on the password confirmation' do
        user.password_confirmation = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end

    context 'when password does not match password confirmation' do

      it 'should not be valid' do
        user.password = 'tomato'
        user.valid?
        expect(user).to_not match(password_confirmation)
      end

      it 'reports a validation error on the password matching' do
        user.password = 'tomato'
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end

    context 'when a duplicate email is provided' do

      it 'should not be valid' do 
        user.save
        expect(user2).to_not be_valid
      end
  
      it 'reports a validation error on the email' do
        user.save
        user2.valid?
        expect(user2.errors.full_messages).to include "Email has already been taken"
      end
    end

    context 'when a password is not long enough' do
      it 'should not be valid' do 
        expect(user3).to_not be_valid
      end

      it 'reports a validation error on the email' do
        user3.valid?
        expect(user3.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
      end
    end
  

  end
end



# has_many :reviews
# has_secure_password

# validates :first_name, presence: true
# validates :last_name, presence: true
# validates :email, uniqueness: true