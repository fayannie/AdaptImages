Feature: Upload Image

  In order to manage image
  As an user
  I want to upload image

  # Scenario: Upload Image
  #   Given I am on image upload page
  #   When I attach the "clown.jpg" image
  #   And I press "Upload Image" button
  #   Then I should see the uploaded image

  Scenario: Uploading an image
    When I attach the file "kid01.jpg"
    Then I should see the "kid01-jpg" image
