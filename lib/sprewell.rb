class Sprewell
  def self.spin_test command=nil
    if command
    path = Dir.pwd
    parent_directory = path.split("/").last

    dot_directory = ".#{parent_directory}"
    FileUtils.mkdir dot_directory
    FileUtils.cp_r Dir["#{path}/*"], dot_directory
    FileUtils.chdir dot_directory
    orig_std_out = STDOUT.clone
    STDOUT.reopen(File.open(path + '/sprewell.log', 'w'))
    Kernel.system command
    STDOUT.reopen(orig_std_out)
    FileUtils.chdir ".."
    else
      STDOUT.puts <<-EOF
        Please provide a command

        Exmaple: sprewell "rspec spec"
      EOF
    end
  end
end
