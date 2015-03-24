# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    # Using NORMAL factory generated data
    # association :nursinghomename
    # streetname '5th Avenue'
    # streetnumber 'West 23rd Street'
    # building '184'
    # city 'Manhattan'
    # state 'NY'
    # zipcode '10010'
     #county 'Manhattan'

    #Using Faker for test Data

    city { Faker::Address.city}
    streetname {Faker::Address.street_name}
    streetnumber {Faker::Address.street_address}
    secondaryaddress {Faker::Address.secondary_address}
    buildingnumber {Faker::Address.building_number}
    zipcode {Faker::Address.zip_code}
    stateabbr {Faker::Address.state_abbr}
    state {Faker::Address.state}
    country {Faker::Address.country}
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
  end

  factory :invalid_address do
    city nil
  end

  end
