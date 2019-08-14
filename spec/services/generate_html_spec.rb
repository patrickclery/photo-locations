RSpec.describe Lendesk::GenerateHTML do

  include_context 'stub_filenames_and_images'

  let(:tmp_filename) { 'rspec.html' }
  let(:tmp_file) { Tempfile.new(tmp_filename) }

  it 'can create a new HTML file' do
    subject.call(output_filename: tmp_file.path,
                 path:            '/fake/dir')

    html = File.open(tmp_file.path)
    expect(html.size).to be_nonzero
  end

  it 'is executable from the command-line' do
    pending
    fail
  end
  it 'scans the current working directory by default' do
    expect(Dir).to receive(:glob)
                     .with("#{Dir.pwd}/**/*.jpg")

    subject.call(output_filename: tmp_file.path)
  end

  it 'accepts a directory as an optional parameter' do
    pending
    expect(subject).to respond_to(:call).with(path: '/fake/dir')
  end
end
