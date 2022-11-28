FactoryBot.define do
    factory :user do
      login { 'Gal Anonim' }
      about_me { 'Lorem Ipsum' }
      email { "email#{SecureRandom.uuid}@unknowndomain.pl" }
      password { "somepassword" }
      status { 0 }
    end
  end