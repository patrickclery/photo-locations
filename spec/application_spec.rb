RSpec.describe 'Shell application' do

  include_context 'stub_filenames_and_images'

  it 'is executable from the command-line' do
    expect(File.executable?("./application.rb")).to be true
  end

  it 'can accept an optional output file' do

  end

  it 'can create a CSV file' do
    exec("./application.rb -o #{tmp_file.path}")
    expect(exit_status).to be true

    csv = File.open(tmp_file.path)
    expect(csv.size).to be_nonzero
  end

end
