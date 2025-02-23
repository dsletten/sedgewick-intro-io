#!/usr/local/bin/io
//
//
//   Name:               random-range.io
//
//   Started:            Tue Feb 11 14:34:08 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

isValid := method(x,
  x % 1 == 0
)

randomRange := method(a, b,
  if(a > b,
    randomRange(b, a),
    Random setSeed(Date clone now asNumber)
    Random value(b - a + 1) floor + a
  )
)
  
if(System args size == 3,
  a := System args at(1) asNumber
  b := System args at(2) asNumber
 
  if(isValid(a) and isValid(b),
    "Random [#{a},#{b}]: #{randomRange(a, b)}" interpolate println,
    "Corrupt" println
  )
)

