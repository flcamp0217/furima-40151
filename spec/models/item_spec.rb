require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を新規登録できるとき' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を新規登録できないとき' do
      it 'itemが画像なしでは登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.item_show = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item show can't be blank")
      end
      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が空では登録できない' do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it '配送料の負担の情報が空では登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域の情報が空では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数の情報が空では登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格の情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は¥300~¥9,999,999の間でないと登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は¥300~¥9,999,999の間でないと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数値でないと登録出来ない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end
      it '価格は半角数値でないと登録出来ない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end
    end
  end
end
