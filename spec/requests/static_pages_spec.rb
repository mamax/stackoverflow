require 'rails_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do

    before { visit root_path }
    let(:heading)    { 'Stackoverflow' }
    let(:page_title) { '' }
    it { should_not have_title('| Home') }

    it_should_behave_like "all static pages"

    it "should have the right links on the layout" do
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
      click_link "Home"
      expect(page).to have_title(full_title(''))
      click_link "Sign up now!"
      expect(page).to have_title(full_title('Sign up'))
      click_link "stackoverflow"
      expect(page).to have_title(full_title(''))
    end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end


end
