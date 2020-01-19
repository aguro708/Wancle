# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create!(
  [
    {
      genre: 'スポーツ',

    },
    {
      genre: '料理',

    },
    {
      genre: 'エンタメ',

    },
    {
      genre: '美容',

    },
    {
      genre: '政治',

    },
    {
      genre: '雑学',

    },
    {
      genre: 'ファッション',

    },
    {
      genre: 'グルメ',

    },
    {
      genre: 'インテリア',

    },
    {
      genre: 'スポット',

    },
    {
      genre: '旅行',

    },
])

User.create!(
	[
		{
			name: 'sss',
			writer: 'writer',
			old: 10,
			gender: '男',
			email: 'a@a.com',
			password: 'aaaaaa',
		}])
Post.create!(
	[
		{
			content: '吉田正尚のトレーニング方法について',
			genre_id: 1,
			user_id: 1,
		}])
Admin.create!(
	[
		{
			email: 'zhiyeahei878@gmail.com',
			password: 'naoya0818wancleaguro',
		}])