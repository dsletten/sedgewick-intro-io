#!/usr/local/bin/io
//
//
//   Name:               polar-coordinates.io
//
//   Started:            Fri Feb 21 21:58:22 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.23
//
//
//

isValid := method(x,
  x isNan not
)

hypotenuse := method(x, y,
  (x**2 + y**2) sqrt
)

cartesianToPolar := method(x, y,
  list(hypotenuse(x, y), y atan2(x))
)

if(System args size == 3,
  x := System args at(1) asNumber
  y := System args at(2) asNumber

  if(isValid(x) and isValid(y),
    coords := cartesianToPolar(x, y)
    "(#{x},#{y}) -> r: #{coords at(0)} theta: #{coords at(1)}" interpolate println,
    "Corrupt" println
  )
)