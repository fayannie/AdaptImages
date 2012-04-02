When /^I attach the file "([^"]*)"$/ do |image|
  visit "/images/new"
  attach_file("image_file", File.join(Rails.root, "features/data", image))
  click_on('Upload Image')
end

Then /^I should see the "([^"]*)" image$/ do |image|
  page.should have_selector(:xpath, "//img[@src=\"#{image}\"]")
end


