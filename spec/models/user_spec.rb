require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email is invalid")
    end
    it 'emailに@がないと登録できない' do
      
    end
    it 'emailに@がないと登録できない' do
      user = User.new(name: 'test', email: 'test', password: '123456', password_confirmation: '123456')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが英語のみでは登録できない' do
      user = User.new(name: 'test', email: 'test@test.com', password: 'abcdefg', password_confirmation: 'abcdefg')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
    end
    
  end
end
