Given(/^I am an existing user$/) do
  visit '/users/new'
  fill_in 'email', with: 'fart@brazil.com'
  fill_in 'password', with: 'supersecret'
  fill_in 'password_confirmation', with: 'supersecret'
  click_button 'Sign Up'
  click_button 'Sign Out'
end

Given(/^I click the sign in button$/) do
  visit '/'
  click_on 'Sign In'
  expect(current_path).to eq('/sessions/new')
  page.should have_content 'Log In'
end

When(/^I enter my details correctly and click the sign in button$/) do
  visit '/sessions/new'
  fill_in 'email', with: 'fart@brazil.com'
  fill_in 'password', with: 'supersecret'
  click_button 'Sign In'
  expect(current_path).to eq('/')
end

Then(/^I should be welcomed back$/) do
  page.should have_content 'Welcome, fart@brazil.com!'
end

When(/^I enter my details incorrectly and click the sign in button$/) do
  visit '/sessions/new'
  fill_in 'email', with: 'fart@brazil.com'
  fill_in 'password', with: 'supersecrr'
  click_button 'Sign In'
  expect(current_path).to eq('/sessions')
end

Then(/^I should not be logged in$/) do
  page.should_not have_content 'Welcome, fart@brazil.com!'
end

Then(/^I should see an error message$/) do
  page.should have_content 'The email or password are incorrect'
end