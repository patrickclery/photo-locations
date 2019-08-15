RSpec.describe Lendesk::GenerateCSV do

  include_context 'stub_filenames_and_images'

  it 'should create a new CSV file' do
    subject.call(target_directory: '/fake/dir', output_file: tmp_file)
    csv = CSV.readlines(tmp_file.path)
    expect(csv.size).to eq(6)
  end

end
