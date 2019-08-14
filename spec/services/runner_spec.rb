RSpec.describe Lendesk::Runner do

  subject { described_class }

  it 'calls the service to loop through images' do
    expect(Lendesk::GetDirectoryImages).to receive(:call)
                                             .with(path: "/fake/dir")
    subject.call('/fake/dir')
  end

  it 'outputs the name of that image' do
    pending
  end
  it 'GPS co-ordinates it finds to a CSV file' do
    pending
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
