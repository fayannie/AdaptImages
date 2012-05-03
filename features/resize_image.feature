Feature: Resize Image

  In order to manage image
  As an user
  I want to resize image

  #Scenario: Resizing image to default size
    #Given I have uploaded the "test.jpg" image
    #When I press "Resize to 100*100"
    #Then I should see the resized image
 
  Scenario: Resizeing Image with updating resize width and height
    Given I have uploaded the "test.jpg" image
    When I update values of width and height 
    And I press "Resize to 180*150" to resize image
    Then I should see another resized image
