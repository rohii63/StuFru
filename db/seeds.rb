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

target_comments = [
"薬学部合格",
"センター７割取りたい！",
"継続は力なり",
"毎日４時間は勉強する",
"医者になるしかない",
"２０２０年１月〜本気出す！",
"物理偏差値７０目指す！",
"現役合格",
"将来は政治家になりたい！",
"YouTubeは１日１時間",
"水滴石を穿つ",
"英語話せるようになりたい",
"いつやるの？ 今でしょ！",  
"大学生活エンジョイしたい！",
"明日やろうは馬鹿野郎",
"現役で合格する",
"ライバルに負けないように頑張る！",
"学年１０位以内",
"化学オタクになる！",
"毎週５０時間",
"医学部に入りたい",
"映画は字幕なしでみる。",
"4時に起きて勉強する"
]

book_names = [
  "読解を深める現代文単語〈評論・小説〉",
  "ステップアップノート30古典文法基礎ドリル (河合塾シリーズ)",
  "古文上達 読解と演習56",
  "重要古文単語315",
  "センター日本史B一問一答-完全版(東進ブックス 大学受験 高速マスター)",
  "詳説日本史 改訂版 [日B309] 文部科学省検定済教科書 81山川/日B309】",
  "センター試験政治・経済集中講義 改訂版 (大学受験super lecture公民)",
  "1対1対応の演習/数学B 新訂版 (大学への数学 1対1シリーズ)",
  "Focus Gold数学1+A",
  "チャート式基礎からの数学II+B",
  "新課程チャート式基礎からの数学1+A",
  "セミナー化学基礎+化学",
  "セミナー物理基礎+物理",
  "進研ゼミ 受験エンカレッジ化学",
  "物理のエッセンス 力学・波動 (河合塾シリーズ)",
  "DUO 3.0",
  "Next Stage 英文法・語法問題 3rd edition",
  "やっておきたい英語長文500(河合塾SERIES)",
  "英単語ターゲット1900 5訂版(大学JUKEN新書)",
  "英文法・語法Vintage",
  "進研ゼミ 受験エンカレッジ英語",
  "速読英熟語",
  "大学入試英語長文ハイパートレーニングレベル2 センターレベル編"
]

universities = File.open("app/javascript/csv/university_list.csv", mode = "r").readlines

for university in universities do
  University.create(name: university)
end

target = Target.find_by(target_category_id: 8).content
university = University.find(41).name
live = "富山県"

user1 = User.create(
  email: 'trial@mail',
  name: 'お試しユーザー',
  password: 'password',
  confirmed_at: DateTime.now,
  confirmation_sent_at: DateTime.now - 1,
  target: target,
  my_choice_university: university
)

User.create(
  email: 'test@mail',
  name: 'テストユーザー',
  password: 'password',
  confirmed_at: DateTime.now,
  confirmation_sent_at: DateTime.now - 1,
  target_comment: "インディゴインディゴインディゴインディゴ",
  target: target,
  my_choice_university: university,
  sex: "男",
  age: 15,
  live: live,
  job: "高校１年生"
)

23.times do |n|
  faker = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    confirmed_at: DateTime.now,
    confirmation_sent_at: DateTime.now - 1,
    target_comment: target_comments[n],
    target: target,
    my_choice_university: university,
    age: (15..18).to_a.sample(),
    live: live
  )
  case faker.age
  when 15
    faker.update(job: "高校１年生")
  when 16
    faker.update(job: ["高校１年生","高校２年生"].sample())
  when 17
    faker.update(job: ["高校２年生","高校３年生"].sample())
  when 18
    faker.update(job: "高校３年生")
  end
  faker.active_relationships.create(followed_id: 1)
  user1.active_relationships.create(followed_id: faker.id)
  book = Book.create(name: book_names[n])
  book.icon.attach(io: File.open(Rails.root.join("app/assets/images/book_image/image(#{n}).jpg")), filename: "image(#{n}).jpg", content_type: 'image/jpg')
end

# book_category_ids = [26,27,26,27,28,29,29,30,31,26,27,27,27,28,28,31,26,27,29,27,27,28,29]
study_unit = StatusWithBook.study_units.keys
study_unit.delete_at(2)
book_ids = Book.pluck(:id).sort
offset_nums = [1,1,1,1,2,2,3,4,4,4,4,5,5,5,5,6,6,6,6,6,6,6,6]

User.all.each do |user|
  user.book_categories.create(name: "国語")
  user.book_categories.create(name: "日本史")
  user.book_categories.create(name: "政経")
  user.book_categories.create(name: "数学")
  user.book_categories.create(name: "理科")
  user.book_categories.create(name: "英語")
  book_ids.zip(offset_nums) do |book_id, offset_num|
    book_category_id = user.book_categories.all.offset(offset_num).first.id
    user.study_books.create(book_id: book_id)
    user.status_with_books.create(status: "勉強中", study_unit: study_unit.sample(), book_id: book_id, book_category_id: book_category_id)
  end
end