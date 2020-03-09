# -*- encoding : utf-8 -*-
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#  Copyright (C) 2004 Sam Hocevar
#  14 rue de Plaisance, 75014 Paris, France
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#
#
#  David Hagege <david.hagege@gmail.com>
#


require 'awesome_print'

numbers =(Dir['data/*'].map do |f|
  content = File.read(f)

  content.gsub!(/Raw: \(\d+\)/, '')
  content.strip!
  nums = content.split(",").map{|x| x.to_i.abs}
end)

res = []
numbers.each do |nums|
  nums.each_with_index do |n, i|
    res[i] ||= 0
    res[i] += n
  end
end

puts res.map{|x| x / numbers.count}.join(",")

