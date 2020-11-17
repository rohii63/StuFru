# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: 'trial@mail',
  name: 'trial',
  password: 'password',
  confirmed_at: DateTime.now,
  confirmation_sent_at: DateTime.now - 1
)
User.create!(
  email: 'test@mail',
  name: 'test',
  password: 'password',
  confirmed_at: DateTime.now,
  confirmation_sent_at: DateTime.now - 1
)


target_category1_contents = [
  "公務員試験",
  "教員採用試験",
  "法律・ビジネス系",
  "建築・不動産系",
  "土木・設備系",
  "料理・栄養・健康系",
  "医療・福祉・保育系",
  "デザイン・センス・ライフスタイル系",
  "大学院",
  "社会人大学院",
  "MBA",
  "世界遺産検定",
  "気象予報士",
  "旅行業務取扱管理者",
  "漢検",
  "数学検定 算数検定",
  "その他資格取得"
]
target_category2_contents = [
  "プログラミング",
  "PCスキル",
  "ビジネス、経営",
  "自己啓発",
  "コミュニケーション",
  "就職試験（SPIなど）",
  "ニュース、時事",
  "その他スキルアップ"
]
target_category3_contents = [
  "TOEIC",
  "TOEFL",
  "英検",
  "英会話",
  "IELTS",
  "GTEC",
  "その他英語学習"
]
target_category4_contents = [
  "中国語",
  "中国語検定",
  "HSK",
  "フランス語",
  "仏検",
  "スペイン語",
  "ドイツ語",
  "独検",
  "ロシア語",
  "イタリア語",
  "韓国語",
  "ハングル能力検定",
  "TOPIK",
  "その他外国語習得"
]
target_category5_contents = [
  "文学",
  "書道",
  "思想・哲学",
  "将棋・囲碁・チェス・麻雀",
  "その他趣味・教養"
]
target_category6_contents = [
  "法律・政治系",
  "経済・商学・会計系",
  "文学・社会学系",
  "教育・教養系",
  "芸術・美学系",
  "理学系",
  "工学系",
  "医学系",
  "薬学系",
  "看護系",
  "外国語系",
  "その他学問"
]
target_category7_contents = [
  "公務員・政治系",
  "法律系",
  "ビジネス・経営系",
  "経済・金融系",
  "国際・語学系",
  "旅行・観光・ホテル・ブライダル系",
  "マスコミ・芸能系",
  "音楽・イベント系",
  "デザイン・写真・芸術系",
  "ファッション・和裁系",
  "ゲーム・コンピュータ・Web系",
  "自動車・航空・宇宙系",
  "機械・電気・電子・化学系",
  "建築・土木・インテリア系",
  "動物・植物系",
  "自然・環境・バイオ系",
  "美容・理容・ヘアメイク系",
  "メイク・ネイル・エステ系",
  "保育・教育系",
  "福祉系",
  "医療系",
  "健康・スポーツ系",
  "栄養・調理・製菓系"
]
target_category8_contents = [
    "大学受験合格"
  ]

for content in target_category1_contents do
  Target.create(target_category_id: 1, content: content)
end
for content in target_category2_contents do
  Target.create(target_category_id: 2, content: content)
end
for content in target_category3_contents do
  Target.create(target_category_id: 3, content: content)
end
for content in target_category4_contents do
  Target.create(target_category_id: 4, content: content)
end
for content in target_category5_contents do
  Target.create(target_category_id: 5, content: content)
end
for content in target_category6_contents do
  Target.create(target_category_id: 6, content: content)
end
for content in target_category7_contents do
  Target.create(target_category_id: 7, content: content)
end
for content in target_category8_contents do
  Target.create(target_category_id: 8, content: content)
end


require 'faker'

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.unique.email
  user = User.create!(
    name: name,
    email: email,
    password: "password",
    target: "yeild",
    confirmed_at: DateTime.now,
    confirmation_sent_at: DateTime.now - 1
  )
  user.active_relationships.create(followed_id: 1)
end

fakers = User.where(target: "yeild")
target = Target.find_by(target_category_id: 8)
university = University.first

fakers.each do |f|
  f.update(target: target, my_choice_university: university)
end

# targets = []

# targets?.each do |t?|
#   10.times do |n|
#     targets.push(t?.content)
#   end
# end

# fakers.zip(targets) do |f, t|
#   f.update(target: t)
# end


universities = File.open("app/javascript/csv/university_list.csv", mode = "r").readlines

for university in universities do
  University.create(name: university)
end