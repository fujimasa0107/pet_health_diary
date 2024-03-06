require 'rails_helper'

RSpec.describe UserPet, type: :model do
  before do
    @user_pet = FactoryBot.build(:user_pet)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user_pet).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'メールアドレスが空だと登録できない' do
        @user_pet.email = ''
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Email Please enter an email address")
      end

      it 'パスワードが空だと登録できない' do
        @user_pet.password = ''
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Password Please enter a password")
      end

      it 'パスワードが存在してもパスワード（確認用）が空では登録できない' do
        @user_pet.password = '123456'
        @user_pet.password_confirmation = ''
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Password confirmation Please confirm your password")
      end

      it '名前が空だと登録できない' do
        @user_pet.name = ''
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Name Please enter a name")
      end

      it 'ペットの名前が空だと登録できない' do
        @user_pet.pet_name = ''
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Pet name Please enter your pet's name")
      end

      it 'ペットの年齢が空だと登録できない' do
        @user_pet.pet_age = nil
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Pet age Please enter a valid pet age")
      end

      it 'ペットの体重が空だと登録できない' do
        @user_pet.pet_weight = nil
        @user_pet.valid?
        expect(@user_pet.errors.full_messages).to include("Pet weight Please enter a valid pet weight")
      end
    end
  end
end
