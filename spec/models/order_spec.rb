require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'shipping_areaが空だと保存できないこと' do
        @order.shipping_area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order.phone = '０８０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order.phone = '０８０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order.phone = '０８０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが12文字以上だと保存できないこと' do
        @order.phone = '1234567890123'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it 'phoneが10文字以下だと保存できないこと' do
        @order.phone = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
