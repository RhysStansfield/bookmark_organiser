Given(/^I have saved the following links:$/) do |links|

  links.hashes.each do |link|
    Link.create(link)
  end
end

Then(/^I should see Superpage$/) do
  page.should have_content('Superpage')
end
