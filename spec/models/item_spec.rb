require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品投稿ができる時' do
      it 'image,item_name,explain,categori_id,price,brandが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿ができない時'do
      it 'item_nameが存在しないと投稿できない'do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explainが存在しないと投稿できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")        
      end
      it 'category_idが--なら登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")            
      end
      it 'priceが存在しないと投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")            
      end
      it 'priceが数字じゃないと投稿できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")            
      end
      it 'priceが500円より安いと投稿できない' do
        @item.price = '400'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 500")            
      end
      it 'priceが9,999,999円を超えたら投稿できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")            
      end
      it 'brandが存在しないと投稿できない' do
        @item.brand = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand can't be blank")            
      end
    end
  end
end
