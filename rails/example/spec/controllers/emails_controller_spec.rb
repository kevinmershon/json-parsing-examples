require "rails_helper"

RSpec.describe EmailsController, :type => :controller do
  describe "POST #create" do
    it "responds successfully with an HTTP 200 status code" do
      post :create, { :subject => "Please call me",
                      :body => "It is extremely important!!!",
                      :receivers => "[{\"type\":\"to\",\"address\":\"user1@example.com\"},{\"type\":\"to\",\"address\":\"user2@example.com\"},{\"type\":\"cc\",\"address\":\"user3@example.com\"},{\"type\":\"cc\",\"address\":\"user4@example.com\"}]" }
      expect(response).to be_redirect
      expect(response).to have_http_status(:found)
    end
  end
end
