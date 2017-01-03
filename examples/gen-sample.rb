#!/usr/bin/env ruby

# used to generate inputdesc.txt

# ./gen-sample.rb \
#   | colourcard generate --{across,down}=10 \
#   --patch-width=64 --patch-height=30 \
#   --input /dev/stdin \
#   --output inputdesc.png

last = 99

rows = (0..last).map { |x| (0..2).map { |y| last+1-(y*1.5) + x*(0xFF/(last+1+(y*1.5)))*0.50 } }
cells = rows.map { |r| r.map { |c| "%d" % c }.join(' ') + " ## 0x" + r.map { |c| "%02x" % c }.join }

puts cells.join("\n")
