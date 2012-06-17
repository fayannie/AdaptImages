json.images @images do |j, images|
  j.id               images.id
  j.title            images.title
  j.url              url_for(images)
  j.resize_image_link("method" => "POST", "url" => images_url) 
end

json.create_image_link("method" => "POST", "url" => images_url)
