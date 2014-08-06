require "rails_helper"

RSpec.describe Email, :type => :model do
  describe "#extract_json_values" do
    let(:email) { Email.new}
    let(:params) {
      { :subject => "Please call me",
        :body => "It is extremely important!!!",
        :receivers => "[{\"type\":\"to\",\"address\":\"user1@example.com\"},{\"type\":\"to\",\"address\":\"user2@example.com\"},{\"type\":\"cc\",\"address\":\"user3@example.com\"},{\"type\":\"cc\",\"address\":\"user4@example.com\"}]" }
    }
    
    it "saves the joined values in to" do
      email.extract_json_values(params)
      expect(email.to).to eq('user1@example.com, user2@example.com')
    end
    
    it "saves the joined values in cc" do
      email.extract_json_values(params)
      expect(email.cc).to eq('user3@example.com, user4@example.com')
    end
  end
end
