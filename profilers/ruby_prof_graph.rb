require 'ruby-prof'
require './task1'

result = RubyProf.profile do
  work('spec/fixtures/1_000_lines.txt')
end

printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT)