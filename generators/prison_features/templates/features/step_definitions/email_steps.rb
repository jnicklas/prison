require 'email_spec'
require 'email_spec/cucumber'

Then %r{^"([^"]*?)" should receive (\d+) emails?$} do |address, n|
  unread_emails_for(address).size.should == n.to_i 
end

Then %r{^"([^"]*?)" should not receive an email$} do |address|
  find_email(address).should be_nil
end