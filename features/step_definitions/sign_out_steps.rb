Given(/^I am logged in$/) do
  visit '/users/new'
  fill_in 'email', with: 'something@email.com'
  fill_in 'password', with: 'pw'
  fill_in 'password_confirmation', with: 'pw'
  click_button 'Sign Up'
  (User.count).should equal 1
end

When(/^I follow log out$/) do
  visit '/'
  click_button 'Sign Out'
end

Then(/^I should no longer be on the system$/) do
  page.should_not have_content 'Welcome something@email.com!'
end