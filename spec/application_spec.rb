RSpec.describe 'Shell application' do

  include_context 'stub_filenames_and_images'

  it 'is executable from the command-line' do
    expect(File.executable?("./application.rb")).to be true
  end

  it 'can accept an output file as an argument' do
    exit_status = system("./application.rb -o #{tmp_file.path}")
    expect(exit_status).to be true

    csv = File.open(tmp_file.path)
    expect(csv.size).to be_nonzero
  end

  it 'can output to HTML' do
    exit_status = system("./application.rb -o #{tmp_file.path} --html")
    expect(exit_status).to be true

    html = File.open(tmp_file.path)
    expect(html.size).to be_nonzero
  end

end
