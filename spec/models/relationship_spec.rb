require 'rails_helper'

RSpec.describe Relationship, type: :model do
	before do
		@usera = FactoryBot.create(:user)
		@userb = FactoryBot.create(:another_user)
	end

  # factory_bot（usera）が有効かどうかを検査。
  it "has a valid factory of usera" do
    usera = @usera
    expect(usera).to be_valid
  end

  # factory_bot（userb)が有効かどうかを検査。
  it "has a valid factory of userb" do
    userb = @userb
    expect(userb).to be_valid
  end

  # followed_id follower_idがあれば有効。
  it "is valid with followed_id and follower_id" do
  	usera = @usera
  	userb = @userb
  	follow = usera.active_relationships.build(
  		followed_id: userb.id
  		)
  	expect(follow).to be_valid
  end

  # followed_idがなければ無効。
  it "is invalid without followed_id" do
  	usera = @usera
  	userb = @userb
  	follow = usera.active_relationships.build(
  		followed_id: nil
  		)
  	follow.valid?
  	expect(follow.valid?).to eq(false)
  end

  # follower_idがなければ無効。
  it "is invalid without followed_id" do
  	usera = @usera
  	userb = @userb
  	follow = usera.passive_relationships.build(
  		follower_id: nil
  		)
  	follow.valid?
  	expect(follow.valid?).to eq(false)
  end

end
