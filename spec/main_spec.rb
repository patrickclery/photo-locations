RSpec.describe Lendesk::GetDirectoryImages do

  subject { described_class }

  let(:images) {
    [
      "assets/images/resume/barchart.jpg",
      "assets/images/resume/rubymine_macbook_pro.jpg",
      "assets/images/resume/github_contributions.jpg",
      "assets/images/resume/wordcloud.jpg",
      "assets/images/resume/github_calendar.jpg"
    ]
  }

  before do
    allow(Dir).to receive(:glob)
                    .with("/fake/dir/**/*.jpg")
                    .and_return(images)
  end

  it { should respond_to(:call).with(2).arguments }

  it 'recursively reads all of the images from the supplied directory of images' do
    expect(subject.call(path: "/fake/dir")).to be_a(Array)
    expect(subject.call(path: "/fake/dir").size).to be(5)
  end

  it 'extracts their EXIF GPS data (longitude and latitude)' do
    pending
  end
  it 'writes the name of that image' do
    pending
  end
  it 'GPS co-ordinates it finds to a CSV file' do
    pending
  end
  it 'is executable from the command-line' do
    pending
  end
  it 'scans the current working directory by default' do
    pending
  end
  it 'accepts a directory as an optional parameter' do
    pending
  end

  context 'output in different formats' do
    it 'can output to CSV' do
      pending
    end
    it 'can output to HTML' do
      pending
    end
  end
end
