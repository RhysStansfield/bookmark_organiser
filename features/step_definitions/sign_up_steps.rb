When(/^I click on the sign up button$/) do
  visit '/'
  click_on 'Sign Up'
  page.should have_content 'Enter your details to sign up!' 
end

When(/^Enter my details$/) do
  fill_in 'email', with: 'badoing@superswee.com'
  fill_in 'password', with: 'rodrigez'
  fill_in 'password_confirmation', with: 'rodrigez'
  click_button 'Sign Up'
end

Then(/^I should have an account$/) do
  (User.count).should equal 1
end

Then(/^I should see a welcome message$/) do
  page.should have_content 'Welcome, badoing@superswee.com!'
end

When(/^I enter some different in the password confirmation box$/) do
  fill_in 'email', with: 'badoing@superswee.com'
  fill_in 'password', with: 'rodrigez'
  fill_in 'password_confirmation', with: 'BLARGH'
  click_button 'Sign Up'
end

Then(/^I should not have an account$/) do
  (User.count).should equal 0
end

Then(/^I should still be on the sign up page$/) do
  expect(current_path).to eq('/users')
  page.should have_content 'Password does not match the confirmation'
end

Given(/^I already have an account$/) do
  visit '/users/new'
  fill_in 'email', with: 'badoing@superswee.com'
  fill_in 'password', with: 'rodrigez'
  fill_in 'password_confirmation', with: 'rodrigez'
  click_button 'Sign Up'
  (User.count).should equal 1
end

When(/^I try to sign up with the same email$/) do
  visit '/users/new'
  fill_in 'email', with: 'badoing@superswee.com'
  fill_in 'password', with: 'rodrigez'
  fill_in 'password_confirmation', with: 'rodrigez'
  click_button 'Sign Up'
  (User.count).should equal 1
end

Then(/^I should still be on the sign up page and see an error message$/) do
  expect(current_path).to eq('/users')
  page.should have_content "Sorry, that email is already taken!"
end