Given /^I have uploaded the "([^"]*)" image$/ do |image|
  visit "/images/new"
  attach_file("image_file_image_file", File.join(Rails.root, "features/data", image))
  click_on('Upload Image')
end

When /^I update values of width and height$/ do
  click_on 'Update resize width and height'
  fill_in 'Width', :with => '180'
  fill_in 'Height', :with => '150'
end

When /^I press "([^"]*)"$/ do |button|
  click_button('Resize')
end

Then /^I should see the resized image$/ do
  page.should have_xpath("//img[@src=\"/upload/resize/1\"]")
end

