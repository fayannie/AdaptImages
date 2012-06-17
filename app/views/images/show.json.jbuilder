
json.url              url_for(@image)
json.resize_image_link("method" => "POST", "url" => images_url)
json.images_link      images_url
