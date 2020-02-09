require 'rails_helper'

RSpec.describe Like, type: :model do

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

	#　外部キー（user_id、post_id）があれば有効。
	it "is valid with user_id and post_id" do
	  	user = @user
	  	genre = @genre
	  	post = @post
	  	like = user.likes.build(
	  		user_id: 1,
	  		post_id: 1
	  		)
	  	expect(like).to be_valid
	end

	#外部キー(post_id)がなければ無効。
	it "is invalid without post_id" do
		user = @user
		genre = @genre
		post = @post
		like = Like.new(
			user_id: 1,
			post_id: nil
			)
		like.valid?
		expect(like.valid?).to eq(false)
	end

	#外部キー(user_id)がなければ無効。
	it "is invalid without user_id" do
		user = @user
		genre = @genre
		post = @post
		like = Like.new(
			user_id: nil,
			post_id: 1
			)
		like.valid?
		expect(like.valid?).to eq(false)
	end

	#同じ投稿に２回いいねすると無効。
	it "is invalid if you like the same post twice" do
		user = @user
		genre = @genre
		post = @post
		like = Like.create(
			user_id: 1,
			post_id: 1
			)
		like_twice = Like.new(
			user_id: 1,
			post_id: 1
			)
		like_twice.valid?
		expect(like_twice.valid?).to eq(false)
	end

end
