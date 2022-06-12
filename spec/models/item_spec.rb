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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explainが存在しないと投稿できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("説明を入力してください")        
      end
      it 'category_idが--なら登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")            
      end
      it 'priceが存在しないと投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください", "金額は数値で入力してください")            
      end
      it 'priceが数字じゃないと投稿できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")            
      end
      it 'priceが500円より安いと投稿できない' do
        @item.price = '400'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は500以上の値にしてください")            
      end
      it 'priceが9,999,999円を超えたら投稿できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")            
      end
      it 'brandが存在しないと投稿できない' do
        @item.brand = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("ブランドを入力してください")            
      end
    end
  end
end
