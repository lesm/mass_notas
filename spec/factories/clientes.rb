FactoryBot.define do
  factory :cliente, parent: :usuario, class: 'Cliente' do
    password '1qaz2wsx'
  end
end
