require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'name, email, password, password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールを入力してください", "メールは不正な値です")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールは不正な値です")
      end
      it 'emailに.comがないと登録できない' do
        @user.email = 'test@test'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールは不正な値です")
      end
      it '重複したemailが存在すれば登録できない'do
        FactoryBot.create(:user, email: "test@example.com")
        user = FactoryBot.build(:user, email: "test@example.com")
        user.valid?
        expect(user.errors.full_messages).to include("メールはすでに存在します")
      end
      it 'パスワードが存在しないと登録できない' do
        @user.password_digest = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードを入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = '123456a'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード確認とパスワードの入力が一致しません", "パスワード確認を入力してください")
      end
        it 'パスワードが数字のみでは登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数を両方含む必要があります")
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数を両方含む必要があります")
      end
      it 'パスワードが６文字以下であれば登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
    end
  end
end
