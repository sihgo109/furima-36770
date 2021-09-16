require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全て存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it '商品画像がない場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がない場合' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明がない場合' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報がない場合' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品の状態の情報がない場合' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it '配送料の負担の情報がない場合' do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge must be other than 0')
      end
      it '発送元の地域の情報がない場合' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it '発送までの日数の情報がない場合' do
        @item.send_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day must be other than 0')
      end
      it '価格の情報がない場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300円以下の場合' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は9,9999,999円以上の場合' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が半角数値でない場合' do
        @item.price = '100a*'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が全角文字の場合' do
        @item.price = '全角'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が英字の場合' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
