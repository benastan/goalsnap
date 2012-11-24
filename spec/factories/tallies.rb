# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tally do
    axis_type "MyString"
    axis_id 1
    user_id 1
    has_been_spent false
  end
end
