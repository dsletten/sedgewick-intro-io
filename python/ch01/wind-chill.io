#!/usr/local/bin/io
//
//
//   Name:               wind-chill.io
//
//   Started:            Wed Feb 19 14:56:43 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

isValid := method(x, p,
  x isNan not and p call(x)
)

windChill := method(t, v,
  35.74 + 0.6215 * t + (0.4275 * t - 35.75) * (v ** 0.16)
)
  
if(System args size == 3,
  t := System args at(1) asNumber
  v := System args at(2) asNumber

  if(isValid(t, block(t, t abs <= 50)) and isValid(v, block(v, 3 <= v and v <= 120)),
    "Wind chill: #{windChill(t, v)}" interpolate println,
    "Corrupt" println
  )
)