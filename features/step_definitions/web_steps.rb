When /I call "([^"]*)" in (GET|POST|PUT|DELETE) with:$/ do |path, method, json|
  page.driver.send(method.downcase, path, JSON.parse(json))
end

When /^I call "([^"]*)" in (GET|POST|PUT|DELETE)$/ do |path, method|
  page.driver.send(method.downcase, path)
end

When /^I call "([^"]*)"$/ do |path|
  step "I call \"#{path}\" in GET"
end
