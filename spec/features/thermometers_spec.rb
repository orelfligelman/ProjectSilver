require 'rails_helper'

feature "thermometer server behavior" do
  scenario "polling thermometer for new data" do
    admin = create(:admin)

    visit #localhost:5000/thermometers.json

    expect
  end
end