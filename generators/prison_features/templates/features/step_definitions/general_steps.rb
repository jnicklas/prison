Then /^I should see the header "([^\"]*)"$/ do |header|
  response.should have_tag('h1', :text => /#{header}/)
end

Then /^I should see form errors$/ do
  response.should have_tag('#errorExplanation')
end

Then /^I should see a flash (notice|error)$/ do |kind|
  response.should have_tag(".flash", :class => kind)
end