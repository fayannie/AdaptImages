Feature: Upload Image

  In order to manage image
  As an user
  I want to upload image

  # Scenario: Upload Image
  #   Given I am on image page
  #   And I attach the "clown.jpg" image
  #   When I press "Upload Image" button
  #   Then I should see the uploaded image

  Scenario: Uploading an image
    When I upload the "clown.jpg" image
    Then I should see the "1-clown.jpg" image
