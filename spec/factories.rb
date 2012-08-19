FactoryGirl.define do
  factory :form do
    sequence(:name) { |n| "New Form #{n}" }
  end
end
