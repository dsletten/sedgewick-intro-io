#!/usr/local/bin/io
//
//
//   Name:               order-check.io
//
//   Started:            Wed Feb 26 21:56:46 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.25
//
//
//

isValid := method(x,
  x isNan not
)

isAscending := method(x, y, z,
  x < y and y < z
)

if(System args size == 4,
  x := System args at(1) asNumber
  y := System args at(2) asNumber
  z := System args at(3) asNumber

  if(isValid(x) and isValid(y) and isValid(z),
    (isAscending(x, y, z) or isAscending(z, y, x)) asString asCapitalized println,
    "Corrupt" println
  )
)