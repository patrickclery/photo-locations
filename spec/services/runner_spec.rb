RSpec.describe Lendesk::Runner do

  include_context 'stub_filenames_and_images'

  let(:tmp_filename) { 'rspec.csv' }
  let(:tmp_file) { Tempfile.new(tmp_filename) }

  it 'should create a new CSV file' do
    subject.call(output_filename: tmp_file.path,
                 path:            '/fake/dir')

    csv = CSV.readlines(tmp_file.path)
    expect(csv.size).to eq(6)
  end

  it 'is executable from the command-line' do
    pending
    fail
  end
  it 'scans the current working directory by default' do
    allow(Dir).to receive(:glob)
                    .with("#{Dir.pwd}/**/*.jpg")
                    .and_return(filenames)
    expect(Dir).to receive(:glob)
                     .with("#{Dir.pwd}/**/*.jpg")

    subject.call(output_filename: tmp_file.path)
  end

  it 'accepts a directory as an optional parameter' do
    pending
    fail
  end

  context 'output in different formats' do
    it 'can output to CSV' do
      pending
      fail
    end
    it 'can output to HTML' do
      pending
      fail
    end
  end
end
