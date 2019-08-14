require './task2'
require 'rspec-benchmark'
include RSpec::Benchmark::Matchers

describe 'Task1' do
  let(:data_file_path) { 'spec/fixtures/data.txt' }
  let(:output_file_path) { 'result.json' }
  let(:expected_output) { File.read('spec/fixtures/expected_output.json') }
  let(:data_file_path_100k) { 'spec/fixtures/100_000_lines.txt' }

  before { File.delete(output_file_path) if File.exists?(output_file_path) }
  after { File.delete(output_file_path) if File.exists?(output_file_path) }

  it 'return expected data' do
    work(data_file_path)
    expect(File.read(output_file_path)).to eq(expected_output)
  end

  it 'meets performance' do
    expect { work(data_file_path_100k) }.to perform_under(1200).ms
  end

  it 'meets memory allocation' do
    expect { work('spec/fixtures/1_000_lines.txt') }.to perform_allocation(String => 695349, 
                                                                           Hash => 425632, 
                                                                           Array => 322608).bytes
  end
end

