require 'rails_helper'

RSpec.describe User, type: :model do

   describe 'Validations' do
    before do
      @user = User.new(
        password: 'testpw',
        password_confirmation: 'testpw',
        email: 'test@test.com',
        name: 'Tess Love'
      )
    end

    it 'should be valid with valid user' do
      expect(@user).to be_valid
    end

    it 'should not be valid without a user password' do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a user email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'should not be work out if user exist' do
      @user.save
      @user2 = User.new(
        password: 'testpw',
        password_confirmation: 'testpw',
        email: 'test@test.com',
        name: 'Tess Love'
      )

      expect(@user2).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        password: 'testpw',
        password_confirmation: 'testpw',
        email: 'test@test.com',
        name: 'Tess Love'
      )
    end

    it 'log in when it is correct' do
      @login = User.authenticate_with_credentials 'test@test.com', 'testpw'

      expect(@login).to_not be_nil
    end

    it 'scannot log in if the password is incorrect' do
      @login = User.authenticate_with_credentials 'test@test.com', '1234'

      expect(@login).to be_nil
    end


    it 'still log in because email case is not matter' do
      @login = User.authenticate_with_credentials 'Test@test.com', 'testpw'
      expect(@login).to_not be_nil
    end
  end
end