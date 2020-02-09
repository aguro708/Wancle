require 'rails_helper'

RSpec.describe Post, type: :model do
	before do
		@user = FactoryBot.create(:user)
		@genre = FactoryBot.create(:genre)
	end

  # factory_bot（user）が有効かどうかを検査。
  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  # factory_bot（genre)が有効かどうかを検査。
  it "has a valid factory of genre" do
    genre = @genre
    expect(genre).to be_valid
  end

  # 投稿の内容、外部キー（user_id）、外部キー（genre_id）があれば有効。
  it "is valid with title, text and user_id" do
  	user = @user
  	genre = @genre
  	post = user.posts.build(
  		content: "吉田正尚について",
  		user_id: 1,
  		genre_id: 1
  		)
  	expect(post).to be_valid
  end

  # 投稿の内容がなければ無効。
  it "is invalid without content" do
    post = Post.new(content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  # 外部キー（user_id）がなければ無効。
  it "is invalid without user_id" do
    post = Post.new(user_id: nil)
    post.valid?
    expect(post.valid?).to eq(false)
  end

  # 外部キー（genre_id）がなければ無効。
  it "is invalid without genre_id" do
    post = Post.new(genre_id: nil)
    post.valid?
    expect(post.valid?).to eq(false)
  end

  # 投稿の内容が198文字より多ければ無効。
  it "is invalid if content contains more than 198 characters" do
    post = Post.new(content: "あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
    post.valid?
    expect(post.errors[:content]).to include("は198文字以内で入力してください")
  end
end