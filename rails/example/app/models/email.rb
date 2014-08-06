# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  to         :string(255)
#  cc         :string(255)
#  subject    :string(255)
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Email < ActiveRecord::Base
  
  # receivers contains both the to and cc values which have to be separated
  def extract_json_values(params)
    receivers_list = JSON.parse(params[:receivers])
    
    self.to = receivers_list.collect { |el| el['address'] if el['type'] == 'to' }.compact.join(', ')
    self.cc = receivers_list.collect { |el| el['address'] if el['type'] == 'cc' }.compact.join(', ')
  end
end
