FactoryBot.define do
  factory :book do
    name {Faker::Book.title}
    author {Faker::Book.author}
    description { "やりたいことが見つからないあなたにピッタリ" }
    output_memo { "自己分析で自分のやりたいことを見つける" }
    association :user
    created_at { Time.current }
  end
  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end
end
