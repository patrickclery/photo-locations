RSpec.shared_examples 'examples_for_file_generators' do
  it 'scans the current working directory by default' do
    expect(Dir).to receive(:glob)
                     .with("#{Dir.pwd}/**/*.jpg")

    subject.call(output_filename: tmp_file.path)
  end

  it 'accepts a directory as an optional parameter' do
    expect(subject).to respond_to(:call).with_keywords(:path)
  end
end
