#!/usr/bin/env ruby
#
#

require 'prime'
require 'ruby-progressbar'

num = 50
count = 0
candidates = Prime.each(num).to_a.push(0).repeated_combination(num/2)
pbar = ProgressBar.create(:title => "Integers checked", :total => candidates.size, :format => '%a %e |%b>%i| %p%% %t')
candidates.each do |x| 
    count += 1 if x.inject(:+) == num
    pbar.increment
end
puts count
