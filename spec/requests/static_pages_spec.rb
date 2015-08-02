require 'rails_helper'

describe "StaticPages" do

  let(:base_title) { "Stackoverflow" }

  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title}")
    end

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end
end
