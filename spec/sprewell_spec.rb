require 'spec_helper'

describe Sprewell do
  describe '::spin_test' do
    before(:all) do
      Dir.chdir 'spec/fixtures/test_project'
    end

    after(:each) do
      FileUtils.rm("sprewell.log")
      FileUtils.rm_rf(".test_project")
    end

    it 'creates a dot directory of the directory the command is run within' do
      Sprewell.spin_test "echo Hi"
      File.directory?('.test_project').should be_true
    end

    it 'runs the command passed to it' do
      Kernel.should_receive(:system).with('echo Hi')
      Sprewell.spin_test "echo Hi"
    end

    it 'prints the output of the command to a log file in the current directory' do
      Sprewell.spin_test "echo Hi"
      contents = File.read('sprewell.log')
      contents.should include "Hi"
    end

    it 'creates a dot directory for the console output' do
      Sprewell.spin_test "echo Hi"
      File.exist?('sprewell.log').should be_true
    end
  end
end
