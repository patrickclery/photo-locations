RSpec.describe Lendesk::Runner do

  include_context 'stub_filenames_and_images'

  let(:tmp_filename) { 'rspec.csv' }
  let(:tmp_file) { Tempfile.new(tmp_filename) }

  it 'calls the service to loop through images' do
    expect(Lendesk::GetDirectoryImages).to receive(:call)
                                             .with(path: "/fake/dir")
    subject.call('/fake/dir')
  end

  it 'should create a new CSV file' do
    subject.call(output_filename:   tmp_file.path,
                 working_directory: '/fake/dir')

    csv = CSV.readlines(tmp_file.path)
    expect(csv.size).to eq(6)
  end

  it 'writes co-ordinates it finds to a CSV file' do
    expect(File).to receive(:write)
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
