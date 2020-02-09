require 'rails_helper'

RSpec.describe Item, type: :model do
	before do
		@user = FactoryBot.create(:user)
		@genre = FactoryBot.create(:genre)
		@post = FactoryBot.create(:post)
	end

	#factoryBot(user)が有効。
	it "has a valid factory of user" do
		user = @user
		expect(user).to be_valid
	end

	#factoryBot(genre)が有効。
	it "has a valid factory of genre" do
		genre = @genre
		expect(genre).to be_valid
	end

	#factoryBot(post)が有効。
	it "has a valid factory of post" do
		post = @post
		expect(post).to be_valid
	end

	#link content image 外部キー(post_id user_id) あれば有効。
	it "is valid with link,content,image and post_id" do
		user = @user
		genre = @genre
		post = @post
		item = user.items.build(
			link: "https~~~",
			content: "吉田正尚について",
			image: "あああ",
			post_id: 1,
			)
		expect(item).to be_valid
	end

	#imageがなくても有効。
	it "is valid without image" do
		user = @user
		genre = @genre
		post = @post
		item = user.items.build(
			link: "https~~~",
			content: "吉田正尚について",
			post_id: 1
			)
		expect(item).to be_valid
	end

	#linkがなければ無効。
	it "is invalid without link" do
		user = @user
		genre = @genre
		post = @post
		item = user.items.build(
			link: nil,
			content: "吉田正尚について",
			image: "あああ",
			post_id: 1)
		item.valid?
		expect(item.valid?).to eq(false)
	end

	#contentがなければ無効。
	it "is invalid without content" do
		user = @user
		genre = @genre
		post = @post
		item = user.items.build(
			link: "あああ",
			content: nil,
			image: "あああ",
			post_id: 1)
		item.valid?
		expect(item.valid?).to eq(false)
	end

	#外部キー(post_id)がなければ無効。
	it "is invalid without content" do
		user = @user
		genre = @genre
		post = @post
		item = user.items.build(
			link: "あああ",
			content: "あああ",
			image: "あああ",
			post_id: nil)
		item.valid?
		expect(item.valid?).to eq(false)
	end

	#外部キー(user_id)がなければ無効。
	it "is invalid without user_id" do
		user = @user
		genre = @genre
		post = @post
		item = Item.new(
			link: "あああ",
			content: "あああ",
			image: "あああ",
			post_id: 1,
			user_id: nil
			)
		item.valid?
		expect(item.valid?).to eq(false)
	end

	# 記事の紹介文が100文字より多ければ無効。
	it "is invalid if content contains more than 100 characters" do
		item = Item.new(content: "あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
		item.valid?
		expect(item.errors[:content]).to include("は100文字以内で入力してください")
	end

end
