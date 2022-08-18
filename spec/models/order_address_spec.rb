require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'user_idが空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @order_address.post_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」では購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市町村が空では購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では購入できない' do
        @order_address.house_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @order_address.phone_num = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が12桁以上あると購入できない' do
        @order_address.phone_num = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が9桁以下だと購入できない' do
        @order_address.phone_num = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end
end
