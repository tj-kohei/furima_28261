require 'rails_helper'

describe User, type: :model do
  describe 'ユーザー情報' do
    before do
      
      @user = FactoryBot.build(:user)
    end

    it "全てのデータがあれば保存できること"do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      FactoryBot.create(:user, email: @user.email)
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      binding.pry
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailには@を含まないと登録できないこと" do
      @user.email = "aaa@yahoo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合であること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
