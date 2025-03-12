#!/usr/local/bin/io
//
//
//   Name:               uniform-random.io
//
//   Started:            Wed Mar  5 13:42:44 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.27
//
//
//

n := 5

Random setSeed(Date clone now asNumber)

xs := list()

for(i, 1, n, xs push(Random value))

xs foreach(println)

"Average = #{xs average}" interpolate println
"Min     = #{xs min}" interpolate println
"Max     = #{xs max}" interpolate println

