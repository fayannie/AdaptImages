Feature: Resize Image

  In order to manage image
  As an user
  I want to resize image

  Scenario: Resizing Image to Default Size
    Given I have uploaded the "test.jpg" image
    When I press "Resize to 100*100"
    Then I should see the resized image
 
  Scenario: Resizeing Image with Updating Resize Width and Height
    Given I have uploaded the "test.jpg" image
    When I update values of width and height 
    And I press "Resize to 150*150" to resize image again
    Then I should see another resized image
