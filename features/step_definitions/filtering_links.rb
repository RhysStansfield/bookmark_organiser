Given(/^I have the tag "(.*?)"$/) do |tag|
  visit '/'
  click_link 'Add Link'
  fill_in 'title', with: 'Something'
  fill_in 'uri', with: 'http://this.com'
  fill_in 'description', with: 'Some bollocks'
  fill_in 'tags', with: tag
  click_button 'Add Link'
end

Given(/^I have a link with the tag "(.*?)"$/) do |tag|
  visit '/'
  click_link 'Add Link'
  fill_in 'title', with: 'Something'
  fill_in 'uri', with: 'http://this.com'
  fill_in 'description', with: 'Some bollocks'
  fill_in 'tags', with: tag
  click_button 'Add Link'
end

When(/^I click on "(.*?)"$/) do |tag|
  visit '/'
  click_link tag
end

Then(/^I should see all links tagged with "(.*?)"$/) do |tag|
  (page).has_content? tag
end