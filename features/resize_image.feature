Feature: Resize Image

  In order to manage image
  As an user
  I want to resize image
 
  Scenario: Resizeing Image with updating resize width and height
    Given I have uploaded the "test.jpg" image
    When I update values of width and height 
    And I press "Resize"
    Then I should see the resized image
