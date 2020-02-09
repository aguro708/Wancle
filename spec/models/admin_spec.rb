require 'rails_helper'

RSpec.describe Admin, type: :model do

	#email,passwordがあれば有効。
	it "is valid with email,password" do
		admin = Admin.new(
			email: "a@a.com",
			password: "aaaaaa"
		)
		expect(admin).to be_valid
	end

	#emailがなければ無効
	it "is invalid without email" do
		admin = Admin.new(
			email: nil,
			password: "aaaaaa"
		)
		admin.valid?
		expect(admin.valid?).to eq(false)
	end

	#passwordがなければ無効
	it "is invalid without password" do
		admin = Admin.new(
			email: "a@a.com",
			password: nil
		)
		admin.valid?
		expect(admin.valid?).to eq(false)
	end

	#emailが正規表現でなければ無効。
	it "is invalid if email is not a regular expression" do
		admin = Admin.new(
			email: "a@a",
			password: "aaaaaa"
		)
		admin.valid?
		expect(admin.valid?).to eq(false)
	end
end
