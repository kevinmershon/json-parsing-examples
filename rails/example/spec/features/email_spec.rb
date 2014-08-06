require 'rails_helper'

describe 'Email submission', :js => true do

  before { visit new_email_path }

  context 'when valid values are filled in' do
    before do
      fill_in 'To:', :with => 'user1@example.com, user2@example.com'
      fill_in 'CC:', :with => 'user3@example.com, user4@example.com'
      fill_in 'Subject', :with => 'Important!'
      fill_in 'Body', :with => 'ಠ_ಠ'
      click_button 'Send'
    end

    it 'displays the To: value correctly' do
      expect(page).to have_field 'to_field', with: 'user1@example.com, user2@example.com'
    end

    it 'displays the CC: value correctly' do
      expect(page).to have_field 'cc_field', with: 'user3@example.com, user4@example.com'
    end

    it 'displays the subject line correctly' do
      expect(page).to have_field 'subject', with: 'Important!'
    end

    it 'displays the body correctly' do
      expect(page).to have_field 'body', with: 'ಠ_ಠ'
    end
  end
end

