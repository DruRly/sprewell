require 'spec_helper'

describe Sprewell do
  describe '::spin_test' do
    before(:each) do
      Dir.chdir 'spec/fixtures/test_project'
      Sprewell.spin_test
    end

    after(:each) do
      FileUtils.rm_rf(".test_project")
    end

    it 'creates a dot directory of the directory the command is run within' do
      File.directory?('.test_project').should be_true
    end
    it 'runs the command passed to it'
    it 'prints the output of the command to a log file in the current directory'
  end
end
