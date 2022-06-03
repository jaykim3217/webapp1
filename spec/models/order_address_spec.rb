require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user, item_id: item)
    sleep 0.1
  end

  describe '購入機能' do
    context '購入できる時' do
      it '全部入力したら購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない時' do
      it 'postal_codeが存在しない場合は保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列のみ出なければ保存でいない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code をハイフン(-)を含めて正しく入力してください")
      end
      it 'region_idがないと保存できない' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region を入力してください")
      end
      it 'cityがないと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_numberがないと保存できない' do
        @order_address.address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberがないと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")        
      end
      it 'phone_numberが12以上なら保存できない' do
        @order_address.phone_number = '123456789101'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9以下なら保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに半角数字以外の文字が含まれたら保存できない' do
        @order_address.phone_number = '1234５678910'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'token(クレジットカード情報がなければ購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
