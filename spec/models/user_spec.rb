require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
        # nicknameが空では登録できないテストコードを記述します
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      # ここから自分！
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors[:email]).to include('has already been taken')
      end
      it 'メールアドレスは、@を含んでいないと登録出来ない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力でないと登録出来ない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角での入力でないと登録出来ない' do
        @user.password = '１１１１１１'
        @user.password_confirmation = '１１１１１１'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混在で入力してください')
      end
      it 'パスワードは数字のみでは登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混在で入力してください')
      end
      it 'パスワードは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
      end
      it 'パスワードとパスワード（確認）は、値が一致していないと登録出来ない' do
        @user.password = '123456uoo'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字が入力されていないと登録出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)は、名前が入力されていないと登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角苗字)は、全角（漢字・ひらがな・カタカナ）で入力されていないと登録出来ない' do
        @user.last_name = 'uooo'
        @user.valid?
        expect(@user.errors[:last_name]).to include('is invalid. Input full-width characters.')
      end
      it 'お名前(全角名前)は、全角（漢字・ひらがな・カタカナ）で入力されていないと登録出来ない' do
        @user.first_name = 'uoooo'
        @user.valid?
        expect(@user.errors[:first_name]).to include('is invalid. Input full-width characters.')
      end
      it ' お名前カナ(全角)は、名字が入力されていないと登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it ' お名前カナ(全角)は、名前が入力されていないと登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it ' お名前カナ(全角)は、全角（カタカナ）で入力されていないと登録出来ない' do
        @user.last_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
      end
      it ' お名前カナ(全角)は、全角（カタカナ）で入力されていないと登録出来ない' do
        @user.first_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end

      it ' 生年月日が入力されていないと登録出来ない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
