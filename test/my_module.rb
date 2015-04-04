require File.expand_path("../../helper/my_module.rb", __FILE__) 
require File.expand_path("../../class/yaml_reader.rb", __FILE__) 
require "minitest/autorun"
require 'yaml'
class TestMyModule < Minitest::Test
    include MyModule
	  def setup
      @file = "sampl.yaml"
      @adress = File.dirname(File.expand_path("",__FILE__)) + '/data/' + @file
      @yaml = YamlReader.new
      @hash = YAML::load(File.open(@adress))
    end

    def test_get_open
      assert_equal "GOOD!", @yaml.get_open(@adress, false)
    end
  
    def test_hash_open
      assert_equal "GOOD!", @yaml.hash_open(@hash)
    end
end