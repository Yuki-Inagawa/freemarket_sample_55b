FactoryBot.define do
  factory :address do
    user_id             {1}
    postal_code         {"267-0066"}
    region              {"千葉県"}
    city                {"千葉市緑区"}
    address_number      {"11-15"}
  end
end