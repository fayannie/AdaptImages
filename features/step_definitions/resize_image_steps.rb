Given /^I have uploaded the "([^"]*)" image$/ do |image|
  visit "/images/new"
  attach_file("image_file_image_file", File.join(Rails.root, "features/data", image))
  click_on('Upload Image')
end

When /^I press "([^"]*)"$/ do |button|
  click_button('Resize to 100*100')
end

Then /^I should see the resized image$/ do
  page.should have_xpath("//img[@src=\"/upload/resize/1\"]")
end

When /^I update values of width and height$/ do
  visit "/images/1/edit"
  fill_in 'Width', :with => '150'
  fill_in 'Height', :with => '150'
  click_on('Update')
end

When /^I press "([^"]*)" to resize image again$/ do |button|
  click_button('Resize to 150*150')
end

Then /^I should see another resized image$/ do
  page.should have_xpath("//img[@src=\"/upload/resize/2\"]")
end

