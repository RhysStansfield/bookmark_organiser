Then(/^I should have a link in my database$/) do
  (Link.all.count).should equal 3
end

Given(/^I am using the bookmark manager$/) do
  visit '/'
end

When(/^I add a link with a description$/) do
  @description = 'A nice search engine'
  click_link 'Add Link'
  fill_in 'title', with: 'Google'
  fill_in 'uri', with: 'http://bing.com'
  fill_in 'description', with: @description
  click_button 'Add'
end

Then(/^the link should have a description$/) do
  expect(Link.last.description).to eq @description
end