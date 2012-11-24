# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    User.create(
      email: 'bennyjbergstein+goalsnap.test.user@gmail.com',
      first_name: 'ben'
    )
  end
end
