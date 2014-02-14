require 'spec_helper'

describe Sprewell do
  describe '::spin_test' do
    before(:all) do
      Dir.chdir 'spec/fixtures/test_project'
    end

    context 'with an argument' do
      after(:each) do
        FileUtils.rm("sprewell.log")
        FileUtils.rm_rf(".test_project")
      end

      it 'copies the current directory to a dot directory' do
        Sprewell.spin_test "echo Hi"
        File.directory?('.test_project').should be_true
      end

      it 'runs the command passed' do
        Kernel.should_receive(:system).with('echo Hi')
        Sprewell.spin_test "echo Hi"
      end

      it 'prints the output of the command to a log file in the current directory' do
        Sprewell.spin_test "echo Hi"
        contents = File.read('sprewell.log')
        contents.should include "Hi"
      end

      it 'creates sprewell.log for console output' do
        Sprewell.spin_test "echo Hi"
        File.exist?('sprewell.log').should be_true
      end
    end

    context 'without an argument' do
      let(:usage) {
        <<-EOF
        Please provide a command

        Exmaple: sprewell "rspec spec"
        EOF
      }

      it 'prints usage' do
        STDOUT.should_receive(:puts).with(usage)
        Sprewell.spin_test
      end
    end
  end
end
