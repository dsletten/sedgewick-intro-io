#!/usr/local/bin/io
//
//
//   Name:               quadratic-sedgewick.io
//
//   Started:            Mon Jan 20 04:55:42 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

b := System args at(1) asNumber
c := System args at(2) asNumber

discriminant := b * b - 4 * c
d := discriminant sqrt

"Root 1: #{(-b + d) / 2}" interpolate println
"Root 2: #{(-b - d) / 2}" interpolate println
