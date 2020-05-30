FactoryBot.define do
  factory :user do
    name {"HungTranTGF"}
    email {"hungtrantgf@gmail.com"}
    hashed_password {User.hash("123")}
  end
end
