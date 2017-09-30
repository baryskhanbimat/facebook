FactoryGirl.define do
  factory :user, class: User do
    email 'baryskhan.bimat@ce.sdu.edu.kz'
    password 'united'
  end
  factory :friend, class: User do
    email 'baryskhan@bk.ru'
    password 'united'
  end
end
