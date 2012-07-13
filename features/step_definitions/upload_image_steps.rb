When /^I attach the file "([^"]*)"$/ do |image|
  visit "/images/new"
  attach_file("image_file_image_file", File.join(Rails.root, "features/data", image))
  click_on('Upload Image')
end

When /^I upload "([^"]*)" through the API$/ do |image|
  upload = Rack::Test::UploadedFile.new(File.join(Rails.root, "features/data", image), "image/jpeg", true)
  page.driver.post "/images.json", "image_file" => { "image_file" => upload }
end

Then /^I should see the "([^"]*)" image$/ do |image|
  page.should have_xpath("//img[@src=\"/upload/1\"]")
end

Then /^I should see the "([^"]*)" image in the page$/ do |image|
  page.should have_xpath("//img[@src=\"/upload/2\"]")
end

