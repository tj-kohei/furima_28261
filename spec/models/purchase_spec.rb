require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '注文新規登録' do
    context '注文新規登録がうまくいくとき' do
      it "関連モデルのレコードがあれば新規登録できる" do

        expect(@purchase).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "userが存在しないと登録できない" do
        @purchase.user = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User must exist")
      end
      it "itemが存在しないと登録できない" do
        @purchase.item = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item must exist")
      end
    end
  end
end