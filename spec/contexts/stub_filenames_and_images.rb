RSpec.shared_context "stub_filenames_and_images" do

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

  # If EXIFR is called, it'll return this
  let!(:exif) { EXIFR::JPEG.new('./spec/data/DSCN0010.jpg') }

  before(:each) do
    # Return 5 fake filenames if the app to read a directory
    allow(Dir).to receive(:glob)
                    .with(any_args)
                    .and_return(filenames)

    # Return fake image EXIF if the app access IO.read
    filenames.each do |filename|
      allow(EXIFR::JPEG).to receive(:new)
                              .with(filename)
                              .and_return(exif)
    end
  end

end
