FactoryBot.define do

  factory :user do
    id                  {1}
    nickname            {"inagawa"}
    family_name         {"稲川"}
    farst_name          {"裕樹"}
    family_name_ruby    {"イナガワ"}
    farst_name_ruby     {"ユウキ"}
    birthday_yiar       {"1993"}
    birthday_month      {"11"}
    birthday_day        {"10"}
    email               {"i@gmail.com"}
    password            {14833123}
    encrypted_password  {"$2a$11$9FGTBO3NnCOUb9fKUUulm.VEeolfAhQ19N10GxS0Kx4RzlRsks4vG"}
  end
end