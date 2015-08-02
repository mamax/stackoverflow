require 'rails_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'Stackoverflow'" do
      visit '/static_pages/home'
      expect(page).to have_content('Stackoverflow')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
end
