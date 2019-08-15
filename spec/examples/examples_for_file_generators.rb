RSpec.shared_examples 'examples_for_file_generators' do

  it { should respond_to(:call).with_keywords(:target_directory, :output_file) }

  before do
    allow(Dir).to receive(:pwd).and_return('/fake/dir')
  end

  it 'scans the current working directory by default' do
    expect(Dir).to receive(:glob)
                     .with("#{Dir.pwd}/**/*.jpg")

    subject.call(output_file:      tmp_file.path,
                 target_directory: '/fake/dir')
  end

end
