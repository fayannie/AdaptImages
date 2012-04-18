Given /^I have uploaded the "([^"]*)" image$/ do |image|
  visit "/images/new"
  attach_file("image_file_image_file", File.join(Rails.root, "features/data", image))
  click_on('Upload Image')
end

Given /^I go to the resize form page$/ do
  visit "/images/1/resize_form"
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in 'Width', :with => '150'
end

When /^I fill in "([^"]*)" with "(\d+)$/ do |field, value|
  fill_in 'Height', :with => '150'
end

When /^I press "([^"]*)"$/ do |button|
  click_on('Resize')
end

Then /^I should see the resized image$/ do
  page.should have_xpath("//img[@src=\"/upload/resize/1\"]")
end

