# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    value "MyString"
    question nil
    username "MyString"
  end
end
