Feature: Upload Image

  In order to manage image
  As an user
  I want to upload image

  Scenario: Uploading an image
    When I attach the file "test.jpg"
    Then I should see the "1" image

  Scenario: Uploading multiple images
    Given I attach the file "test.jpg"
    When I attach the file "test1.jpg"
    Then I should see the "2" image in the page
