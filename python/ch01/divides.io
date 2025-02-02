#!/usr/local/bin/io
//
//
//   Name:               divides.io
//
//   Started:            Sun Feb  2 14:56:06 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

m := System args at(1) asNumber floor
n := System args at(2) asNumber floor

if(m <= 0  or  n <= 0,
  "Corrupt" println,
  if(m % n == 0  or  n % m == 0,
    "True" println,
    "False" println
  )
)

