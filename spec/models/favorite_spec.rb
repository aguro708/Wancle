require 'rails_helper'

RSpec.describe Favorite, type: :model do

	before do
		@user = FactoryBot.create(:user)
		@genre = FactoryBot.create(:genre)
		@post = FactoryBot.create(:post)
		@item = FactoryBot.create(:item)
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

	#factoryBot(item)が有効。
	it "has a valid factory of item" do
		item = @item
		expect(item).to be_valid
	end

	#　外部キー（user_id、item_id）があれば有効。
	it "is valid with user_id and item_id" do
	  	user = @user
	  	genre = @genre
	  	post = @post
	  	item = @item
	  	favorite = Favorite.new(
	  		user_id: 1,
	  		item_id: 1
	  		)
	  	expect(favorite).to be_valid
	end


	#　外部キー（user_id）がなければ無効。
	it "is invalid without user_id" do
	  	user = @user
	  	genre = @genre
	  	post = @post
	  	item = @item
	  	favorite = Favorite.new(
	  		user_id: nil,
	  		item_id: 1
	  		)
	  	favorite.valid?
	  	expect(favorite.valid?).to eq(false)
	end

	#　外部キー（item_id）がなければ無効。
	it "is invalid without item_id" do
	  	user = @user
	  	genre = @genre
	  	post = @post
	  	item = @item
	  	favorite = Favorite.new(
	  		user_id: 1,
	  		item_id: nil
	  		)
	  	favorite.valid?
	  	expect(favorite.valid?).to eq(false)
	end

	# 同じ記事に2回お気に入りすると無効。
	it "is invalid if you favorite the same item twice" do
		user = @user
		genre = @genre
		post = @post
		item = @item
		favorite = Favorite.create(
			user_id: 1,
			item_id: 1
			)
		favorite_twice = Favorite.new(
			user_id: 1,
			item_id: 1
			)
		favorite_twice.valid?
		expect(favorite_twice.valid?).to eq(false)
	end

end
