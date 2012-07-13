Feature: Images API
    In order to develop applications
    As a developer
    I want to manage images
     
    Background:
      Given I attach the file "test.jpg"
    
    Scenario: Images index
      When I call "/images.json" in GET
      Then the JSON should be:
      """
       {
         "images": [{
            "id": 1,
            "title": "test.jpg",
            "url": "/images/1",
            "resize_image_link": {
                "url": "http://www.example.com/images",
                "method": "POST"
          }
          }],
            "create_image_link": {
		"url": "http://www.example.com/images",
		"method": "POST"
  	}
        }
       """
       
     Scenario: Show an image
       When I call "/images/1.json" in GET
       Then the JSON should be:
       """
         {
           "url": "/images/1",
           "resize_image_link": {
                "url": "http://www.example.com/images",
                "method": "POST"
         },
           "images_link": "http://www.example.com/images"
         }
       """

      Scenario: Removing an image and the index is empty
        Given I call "/images/1.json" in DELETE
        When I call "/images.json"
        Then the JSON should be:
        """
         {
            "images": [],
            "create_image_link": {
		"url": "http://www.example.com/images",
		"method": "POST"
  	 }
         }
        """

     Scenario: Creating an image
       Given I upload "test1.jpg" through the API
       When I call "/images/2.json" in GET
       Then the JSON should be:
       """
         {
           "url": "/images/2",
           "resize_image_link": {
                "url": "http://www.example.com/images",
                "method": "POST"
         },
           "images_link": "http://www.example.com/images"
         }
       """

      Scenario: Creating an image should add it to the index
        Given I upload "test1.jpg" through the API
        When I call "/images.json" in GET
        Then the JSON should be:
        """
          {
            "images": [{
                "id": 1,
                "title": "test.jpg",
                "url": "/images/1",
                "resize_image_link": {
                    "url": "http://www.example.com/images",
                    "method": "POST"
          }
          }, {
                "id": 2,
                "title": "test1.jpg",
                "url": "/images/2",
                "resize_image_link": {
                    "url": "http://www.example.com/images",
                    "method": "POST"
          } 
          }],
            "create_image_link": {
		"url": "http://www.example.com/images",
		"method": "POST"
  	}
        }
        """

      Scenario: Resizing an image
         When I update values of width and height 
         And I press "Resize"
         And I call "/images/1/resize_image.json" in GET
         Then the JSON should be:
         """
          {
           "url": "/images/2",
           "images_link": "http://www.example.com/images"
          }
         """

      Scenario: Resizing an image should add it to the index
         When I update values of width and height 
         And I press "Resize"
         And I call "/images.json" in GET
         Then the JSON should be:
         """
           {
            "images": [{
                "id": 1,
                "title": "test.jpg",
                "url": "/images/1",
                "resize_image_link": {
                    "url": "http://www.example.com/images",
                    "method": "POST"
           }
           }, {
                "id": 2,
                "title": "test.jpg_resized",
                "url": "/images/2",
                "resize_image_link": {
                    "url": "http://www.example.com/images",
                    "method": "POST"
           } 
           }],
             "create_image_link": {
		"url": "http://www.example.com/images",
		"method": "POST"
  	   }
           }
         """
