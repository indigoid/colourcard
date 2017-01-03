#!/usr/bin/env ruby

# used to generate inputdesc.txt

rows = (0..8).map { |x| (0..2).map { |y| 16-(y*2) + x*(0xFF/(9+(y*2))) } }
cells = rows.map { |r| r.map { |c| "%d" % c }.join(' ') + " ## 0x" + r.map { |c| "%02x" % c }.join }

puts cells.join("\n")
