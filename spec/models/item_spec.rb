require 'rails_helper'

describe Item, type: :model do
  describe '商品出品' do
    before do
    @item = FactoryBot.build(:item)
    end

    it "全てのデータがあれば保存できること"do
      expect(@item).to be_valid
    end
    it "画像は1枚ないと出品できないこと"do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include()
  end
    it "商品名がないと出品できないこと"do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明がないと出品できないこと"do
      @item.item_detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item detail can't be blank")
    end
      it "カテゴリーの情報がないと出品できないこと"do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
     it "商品の状態についての情報がないと出品できないこと"do
     @item.status_id = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end
    it "配送料の負担についての情報がないと出品できないこと"do
    @item.shipping_fee_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
    end
    it "発送元の地域についての情報がないと出品できないこと"do
    @item.from_location_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("From location can't be blank", "From location is not a number")
    end
    it "発送までの日数についての情報がないと出品できないこと"do
    @item.days_till_ship_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Days till ship can't be blank", "Days till ship is not a number")
    end
    it "価格の範囲が300〜9,999,999の間出ないと出品できないこと"do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list")
    end
  end
end
