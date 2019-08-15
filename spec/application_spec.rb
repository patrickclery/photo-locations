RSpec.describe 'Shell application' do

  include_context 'stub_filenames_and_images'

  it 'is executable from the command-line' do
    expect(File.executable?("./application.rb")).to be true
  end

end
