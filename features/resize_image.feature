Feature: Resize Image

  In order to manage image
  As an user
  I want to resize image

  Scenario: Resizing Image
    Given I have uploaded the "test.jpg" image
    And I go to the resize form page
    When I fill in "width" with "150"
    And I fill in "height" with "150
    And I press "Resize"
    Then I should see the resized image
