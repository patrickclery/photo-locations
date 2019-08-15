RSpec.shared_context "stub_filenames_and_images" do

  subject { described_class }

  let(:filenames) {
    [
      "spec/data/gps_images/cats/image_e.jpg",
      "spec/data/gps_images/image_d.jpg",
      "spec/data/gps_images/image_b.jpg",
      "spec/data/gps_images/image_c.jpg",
      "spec/data/gps_images/image_a.jpg"
    ]
  }
  let(:tmp_filename) { 'rspec.csv' }
  let(:tmp_file) { Tempfile.new(tmp_filename) }

  before(:each) do
    # Return 5 fake filenames if the app to read a directory
    allow(Dir).to receive(:glob)
                    .with(any_args)
                    .and_return(filenames)
  end
end
