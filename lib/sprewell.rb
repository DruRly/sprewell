class Sprewell
  def self.spin_test
    path = Dir.pwd
    parent_directory = path.split("/").last

    FileUtils.mkdir(".#{parent_directory}")
    FileUtils.cp_r(Dir["#{path}/*"], ".#{parent_directory}")
  end
end
