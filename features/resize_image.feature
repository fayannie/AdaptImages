Feature: Resize Image

  In order to manage image
  As an user
  I want to resize image

  Scenario: Resizing Image to Default Size
    Given I have uploaded the "test.jpg" image
    When I press "Resize"
    Then I should see the resized image

 Scenario: Resizeing Image with Updating Resize Width and Height
    Given I have uploaded the "test.jpg" image
    When I fill "width" with "150",fill "height" with "150"
    And I press "Update" to update width and height
    And I press "Resize" again
    Then I should see another resized image
