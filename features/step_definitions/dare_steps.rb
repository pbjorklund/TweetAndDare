Given /^I am on the startpage$/ do
  visit "/"
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, with: value
end

When /^I submit the form$/ do
  click_on 'Dare'
end

Then /^I should see the dare page$/ do
  page.should have_content('run stockholm marathon')
end

Then /^I should get redirected to the twitter authentication$/ do
end
