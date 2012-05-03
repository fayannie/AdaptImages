require 'spec_helper'

describe ResizeImage do
 
   describe 'after_destroy' do
      it 'should run the proper callbacks' do
        resize_image = ResizeImage.new
        resize_image.should_receive(:delete_file)
        resize_image.run_callbacks(:destroy)
      end
   end

end
