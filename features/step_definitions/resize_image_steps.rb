Given /^I have uploaded the "([^"]*)" image$/ do |image|
  visit "/images/new"
  attach_file("image_file_image_file", File.join(Rails.root, "features/data", image))
  click_on('Upload Image')
end

When /^I press "([^"]*)"$/ do |button|
  click_button('Resize')
end

Then /^I should see the resized image$/ do
  page.should have_xpath("//img[@src=\"/upload/resize/1/*\"]")
end

When /^I fill "([^"]*)" with "([^"]*)",fill "([^"]*)" with "([^"]*)"$/ do |field, value, field, value|
  visit "/images/1/edit"
  fill_in 'Width', :with => '150'
  fill_in 'Height', :with => '150'
end

When /^I press "([^"]*)" to update width and height$/ do |button|
 click_on('Update')
end

When /^I press "([^"]*)" again$/ do |button|
  click_button('Resize')
end

Then /^I should see another resized image$/ do
  page.should have_xpath("//img[@src=\"/upload/resize/1/150*150\"]")
end

