FactoryBot.define do

  factory :item do
    user_id         {1}
    name            {"inagawa"}
    text            {"これは商品の詳細です"}
    state           {"新品"}
    postage_type    {"送料込み"}
    delivery_method {"クロネコヤマト"}
    region          {"千葉県"}
    shopping_date   {"2~3日で発送"}
    price           {"1000"}
    category_id     {150}
  end
end