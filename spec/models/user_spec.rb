require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
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
      # emailが空では登録できないテストコードを記述します          
    end

    #ここから自分！
    it 'メールアドレスが一意性でないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
    end
    end
    it 'メールアドレスは、@を含んでいないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'メールアドレスは、@を含んでいないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'パスワードが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'パスワードは、6文字以上での入力でないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'パスワードは、半角英数字混合での入力でないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'パスワードとパスワード（確認）は、値が一致していないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'お名前(全角)は、名字と名前がそれぞれ入力されていないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）で入力されていないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it ' お名前カナ(全角)は、名字と名前がそれぞれ入力されていないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it ' お名前カナ(全角)は、全角（カタカナ）で入力されていないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end
    it ' 生年月日が入力されていないと登録出来ない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    end

  end
end
