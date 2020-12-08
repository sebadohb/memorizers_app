require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  before do
    @dictionary = FactoryBot.build(:dictionary)
  end
  
  describe '単語登録時' do
    context '単語が登録できる時' do
      it '全ての情報が入っている時' do
        expect(@dictionary).to be_valid
      end 
    end

    context '単語登録ができない時' do
      it '単語画像がない' do
        @dictionary.image = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Image can't be blank")
      end
      it '単語名がない' do
        @dictionary.word = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Word can't be blank")
      end
      it '単語の意味がない' do
        @dictionary.meaning = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Meaning can't be blank")
      end
      it '単語の説明がない' do
        @dictionary.definition = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Definition can't be blank")
      end
      it '単語の発音記号がない' do
        @dictionary.pronunciation = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Pronunciation can't be blank")
      end
      it '単語の品詞がない' do
        @dictionary.speech_id = 1
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Speech must be selected")
      end
      it '単語の難易度がない' do
        @dictionary.level_id = 1
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Level must be selected")
      end
      it 'ユーザーが存在しない' do
        @dictionary.user = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("User must exist")
      end
    end
  end 
end
