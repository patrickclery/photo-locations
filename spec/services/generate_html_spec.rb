RSpec.describe Lendesk::GenerateHTML do

  include_context 'stub_filenames_and_images'

  let(:tmp_filename) { 'rspec.html' }

  it 'can create a new HTML file' do
    subject.call(output_file:      tmp_file.path,
                 target_directory: '/fake/dir')

    html_file = File.open(tmp_file.path)
    expect(html_file.size).to be_nonzero
  end

  it 'is executable from the command-line' do
    pending
    fail
  end

end
