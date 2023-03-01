# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
def data_params
  {
    email: FFaker::Internet.email,
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    nickname: FFaker::Name.first_name,
    phone: '123-345-1231'
  }
end

personal_data = PersonalDatum.create(data_params)

2.times do
  personal_data.employers.create(
    employer: FFaker::Company.name,
    date_started: Time.now,
    date_employment_ended: Time.now + 1.week
  )
end
