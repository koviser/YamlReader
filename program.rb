require File.expand_path("../class/yaml_reader.rb", __FILE__)
x = YamlReader.new( "sampl.yaml")
puts x.something.value == 'a'
puts x.something
puts x.something2.sample == [1, 2, 3]
puts x.something.level2.no_method_in_file_error
