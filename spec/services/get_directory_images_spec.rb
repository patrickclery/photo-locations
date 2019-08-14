RSpec.describe Lendesk::GetDirectoryImages do

  subject { described_class }

  let(:filenames) {
    [
      "assets/images/resume/barchart.jpg",
      "assets/images/resume/rubymine_macbook_pro.jpg",
      "assets/images/resume/github_contributions.jpg",
      "assets/images/resume/wordcloud.jpg",
      "assets/images/resume/github_calendar.jpg"
    ]
  }

  before do
    # Return 5 fake filenames if the app to read the directory
    allow(Dir).to receive(:glob)
                    .with("/fake/dir/**/*.jpg")
                    .and_return(filenames)

    # Return fake image EXIF if the app access IO.read
    filenames.each do |filename|
      allow(IO).to receive(:read)
                     .with(filename)
                     .and_return File.open('./spec/data/DSCN0010.jpg')
    end
  end

  it 'recursively reads all of the images from the supplied directory of images' do
    images = subject.call(path: "/fake/dir")
    expect(images).to be_a(Array)
    expect(images.size).to be(5)
    expect(images.all? { |obj| obj.kind_of?(Hash) }).to be true
  end
end
