require 'spec_helper'

describe Image do

   describe 'image_file=(file)' do
     it 'should accept the upload file' do
        Rack::Test::UploadedFile.new(Rails.root.join("spec/support/test.jpg"),'image/jpg')
     end
   end
  
   describe 'after_save' do
     it 'should run the proper callbacks' do
        image = Image.new
        image.should_receive(:save_to_disk)
        image.run_callbacks(:save)
     end
   end

   describe 'after_destroy' do
     it 'should run the proper callbacks' do
        image = Image.new
        image.should_receive(:delete_file)
        image.run_callbacks(:destroy)
     end
   end

end
