RSpec.describe Lendesk::GetDirectoryImages do

  include_context 'stub_filenames_and_images'

  it 'recursively reads all of the images from the supplied directory of images' do
    images = subject.call(path: "/fake/dir")
    expect(images).to be_a(Array)
    expect(images.size).to be(5)
    expect(images.all? { |obj| obj.kind_of?(Hash) }).to be true
  end
end
