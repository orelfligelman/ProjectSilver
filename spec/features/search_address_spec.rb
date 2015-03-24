require 'rails_helper'

feature 'User search for address' do
    background do
    visit root_path
    fill_in "Lemme know where you wanna expire", with: build(:address)
    click_button 'Search'
    end

    scenario "User sees list of nursing homes matching his search" do
    expect(page).to have_content #nursing home list
    end
    scenario "User sees an error message saying why his search was not correct" do
      visit root_path
      fill_in "Lemme know where you wanna expire", with: build(:address, :streetname nil)
      click_button 'Search'
      expect(page).to have_content("I know you're old but you live somewhere, right")
    end
    #overlap with search method from controller specs
    scenario "User inputs first letter of state and views all responses" do
      visit root_path
      fill_in "Lemme know where you wanna expire", with: build(:address, :state "N")
      click_button 'Search'
      expect(page).to have_content["NH","NJ","NY"]
      save_and_open_page
    end

    scenario "User wins the jackpot" do
      visit root_path
      fill_in "Lemme know where you wanna expire", with: build(:address)
      click_button 'Search'
      #this is the 1,000th search. How would I know when it is the 1,000th search?
      expect(page).to have_content(#tweetyblowswhistle.jpg)
      save_and_open_page
    end
end