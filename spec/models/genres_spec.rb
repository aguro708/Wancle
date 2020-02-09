require 'rails_helper'

RSpec.describe Genre, type: :model do

	# ジャンル名があれば有効。
	it "is valid with genre" do
		genre = Genre.new(genre: "スポーツ")
		expect(genre).to be_valid
	end

	# ジャンル名がなければ無効。
	it "is invalid without genre" do
		genre = Genre.new(genre: nil)
		genre.valid?
		expect(genre.errors[:genre]).to include("を入力してください")
	end

end
