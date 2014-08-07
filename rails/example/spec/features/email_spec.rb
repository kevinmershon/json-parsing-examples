require 'spec_helper'

describe 'Email submission' do

  before { visit new_email_path }

  context 'when valid values are filled in' do
    before do
      fill_in 'To:', :with => 'user1@example.com, user2@example.com'
      fill_in 'CC:', :with => 'user3@example.com, user4@example.com'
      fill_in 'Subject', :with => 'Important!'
      fill_in 'Body', :with => 'ಠ_ಠ'
      click_button 'Send'
    end

    it 'should display the To: value correctly', :js => true do
      page.should have_selector '#to', text: 'user1@example.com, user2@example.com'
    end

    it 'should display the CC: value correctly', :js => true do
      page.should have_selector '#cc', text: 'user3@example.com, user4@example.com'
    end

    it 'should display the subject line correctly', :js => true do
      page.should have_selector '#subject', text: 'Important!'
    end

    it 'should display the body correctly', :js => true do
      page.should have_selector '#body p', text: 'ಠ_ಠ'
    end
  end
end

