require File.expand_path("../../class/yaml_reader.rb", __FILE__) 
require "minitest/autorun"
class TestFunctional < Minitest::Test
	def setup
		adress = File.dirname(File.expand_path("",__FILE__)) + '/data/sampl.yaml'
      	@test = YamlReader.new(adress, false)
    end

    def test_value_a_method
      assert_equal "GOOD!", @test.something.value == 'a'
    end

    def test_value_array_method
      assert_equal "GOOD!", @test.something2.sample == [1,2,3]
    end

    def test_value_a_hash
      assert_equal "GOOD!", @test[:something][:value] == 'a'
    end

    def test_value_array_hash
      assert_equal "GOOD!", @test[:something2][:sample] == [1,2,3]
    end

    def test_key_absent_error
    	begin
    		@test.something.level2.level3dfgsdf
    	rescue KeyAbsentError
    		assert true
    	end
    end
end