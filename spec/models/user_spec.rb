require 'rails_helper'

RSpec.describe User, type: :model do

	#email,password,name,gender,old,writerがあれば有効。
	it "is valid with email,password,name,gender,old and writer" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: 20,
			writer: "writer"
		)
		expect(user).to be_valid
	end

	#introduction,profile_imageが追加できる。
	it "is valid if introduction, profile_image can be added" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: 20,
			writer: "writer"
		)
		user.introduction = "あああ"
		user.profile_image = "あああ"
		user.save
		expect(user).to be_valid
	end

	#introductionは100文字より多いと無効。
	it "is invalid if introduction contains more than 100 characters" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: 20,
			writer: "writer"
		)
		user.introduction = "あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"
		user.save
		user.valid?
		expect(user.valid?).to eq(false)
	end

	#emailがなければ無効
	it "is invalid without email" do
		user = User.new(
			email: nil,
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: 20,
			writer: "writer"
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

	#passwordがなければ無効
	it "is invalid without password" do
		user = User.new(
			email: "a@a.com",
			password: nil,
			name: "テスト",
			gender: "男",
			old: 20,
			writer: "writer"
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

	#nameがなければ無効
	it "is invalid without password" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: nil,
			gender: "男",
			old: 20,
			writer: "writer"
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

	#genderがなければ無効
	it "is invalid without password" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: nil,
			old: 20,
			writer: "writer"
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

	#oldがなければ無効
	it "is invalid without password" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: nil,
			writer: "writer"
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

	#writerがなければ無効
	it "is invalid without password" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: 20,
			writer: nil
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

	# nameが20文字より多ければ無効。
	it "is invalid if name contains more than 20 characters" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
  			name: "あああああああああああああああああああああ",
  			gender: "男",
  			old: 20,
  			writer: "writer"
  		)
  		user.valid?
  		expect(user.errors[:name]).to include("は20文字以内で入力してください")
  	end

  	# oldが数値でなければ無効。
	it "is invalid if old is not a number" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: "あ",
			writer: "writer"
		)
		user.valid?
		expect(user.errors[:old]).to include("は数値で入力してください")
	end

  	# oldが0以上でなければ無効。
	it "is invalid if old is not 0 or more" do
		user = User.new(
			email: "a@a.com",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: -1,
			writer: "writer"
		)
		user.valid?
		expect(user.errors[:old]).to include("は0以上の値にしてください")
	end

	#emailが正規表現でなければ無効。
	it "is invalid if email is not a regular expression" do
		user = User.new(
			email: "a@a",
			password: "aaaaaa",
			name: "テスト",
			gender: "男",
			old: 20,
			writer: "writer"
		)
		user.valid?
		expect(user.valid?).to eq(false)
	end

end
