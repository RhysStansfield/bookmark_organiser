Given(/^I follow the "(.*?)" link$/) do |button|
  click_link 'Forgotten Password?'
  expect(current_path).to eq '/password_reset'
end

When(/^I request a new password$/) do
  fill_in 'email', with: 'fart@brazil.com'
  click_button 'Reset Password'
end