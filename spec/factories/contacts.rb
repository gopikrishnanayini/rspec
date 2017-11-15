require 'faker'

FactoryGirl.define do
  factory :contact do |f|
    f.firstname { Faker::Name.first_name }
    f.lastname { Faker::Name.last_name }
    f.email "nayinigopi@email.com"
    f.address "gopikkii"
    f.description "faggaggahj"
  end
end