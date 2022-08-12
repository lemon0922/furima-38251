require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmation,first_name,last_name,read_first,read_first,birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'read_firstが空では登録できない' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end
      it 'read_familyが空では登録できない' do
        @user.read_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family can't be blank")
      end
      it 'birthが空では登録できない' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは半角数字混合でないと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を使用してください')
      end
      it 'パスワードは半角数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を使用してください')
      end
      it 'パスワードは半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を使用してください')
      end
      it '性は全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it '名は全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it '性(カナ)はカタカナでないと登録できない' do
        @user.read_family = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read family カタカナを使用してください')
      end
      it '名(カナ)はカタカナでないと登録できない' do
        @user.read_first = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first カタカナを使用してください')
      end
    end
  end
end
