require File.expand_path("../../class/yaml_reader.rb", __FILE__) 
require "minitest/autorun"
class TestYamlReader < Minitest::Test
    def setup
      @file = "sampl.yaml"
      @adress = File.dirname(File.expand_path("",__FILE__)) + '/data/' + @file
    end
	  
    def test_init_load_file
      yaml = YamlReader.new(@file)
      assert_instance_of(YamlReader, yaml)
    end

    def test_init_no_file
      yaml = YamlReader.new
      assert_instance_of(YamlReader, yaml)
    end

    def test_init_enother_file
      yaml = YamlReader.new(@adress, false)
      assert_instance_of(YamlReader, yaml)
    end    
end