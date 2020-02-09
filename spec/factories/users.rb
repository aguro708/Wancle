FactoryBot.define do
  factory :user, class: User do
  	name { "テストA" }
  	gender { "男" }
  	old { 20 }
  	writer { "writer" }
    email { "testa@test.com" }
    password { "aaaaaa" }
  end
  factory :another_user, class: User do
  	name { "テストB" }
  	gender { "男" }
  	old { 20 }
  	writer { "writer" }
    email { "testb@test.com" }
    password { "bbbbbb" }
  end
end
