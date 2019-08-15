RSpec.describe Lendesk::ImageDirectoryScanner do

  include_context 'stub_filenames_and_images'

  it { should respond_to(:call).with_keywords(:target_directory, :format, :output_file)
  }

  let(:tmp_filename) { 'rspec.html' }
  let(:tmp_file) { Tempfile.new(tmp_filename) }

  it 'can create a new CSV file' do
    subject.call(target_directory: '/fake/dir', format: :csv, output_file: tmp_file)

    html = File.open(tmp_file.path)
    expect(html.size).to be_nonzero
  end

  it 'can create a new HTML file' do
    subject.call(target_directory: '/fake/dir', format: :html, output_file: tmp_file)

    html = File.open(tmp_file.path)
    expect(html.size).to be_nonzero
  end

end
