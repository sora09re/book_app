require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:dish_yesterday) { create(:dish, :yesterday) }
  let!(:dish_one_week_ago) { create(:dish, :one_week_ago) }
  let!(:dish_one_month_ago) { create(:dish, :one_month_ago) }
  let!(:book) { create(:book) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(book).to be_valid
    end

    it "タイトルがなければ無効な状態であること" do
      book = build(:book, name: nil)
      book.valid?
      expect(book.errors[:name]).to include("を入力してください")
    end

    it "タイトルが30文字以内であること" do
      book = build(:book, name: "あ" * 31)
      book.valid?
      expect(book.errors[:name]).to include("は30文字以内で入力してください")
    end

    it "著者がなければ無効な状態であること" do
      book = build(:book, author: nil)
      book.valid?
      expect(book.errors[:author]).to include("を入力してください")
    end

    it "著者が30文字以内であること" do
      book = build(:book, author: "あ" * 31)
      book.valid?
      expect(book.errors[:author]).to include("は30文字以内で入力してください")
    end

    it "説明が140文字以内であること" do
      book = build(:book, description: "あ" * 141)
      book.valid?
      expect(book.errors[:description]).to include("は140文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      book = build(:book, user_id: nil)
      book.valid?
      expect(book.errors[:user_id]).to include("を入力してください")
    end
  end

  context "並び順" do
    it "最も最近の投稿が最初の投稿になっていること" do
      expect(book).to eq Dish.first
    end
  end
end
