#!/usr/local/bin/io
//
//
//   Name:               compound-interest.io
//
//   Started:            Sun Feb 16 22:14:46 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.21
//
//   Rate r must be scaled by 100.
//
//

isValid := method(x, x > 0)

compoundInterest := method(p, r, t,
  p * ((r * t) exp)
)
  
if(System args size == 4,
  p := System args at(1) asNumber
  r := System args at(2) asNumber
  t := System args at(3) asNumber

  if(isValid(p) and isValid(r) and isValid(t),
    "Amount: #{compoundInterest(p, r/100, t)}" interpolate println,
    "Corrupt" println
  )
)