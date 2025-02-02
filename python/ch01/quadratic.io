#!/usr/local/bin/io
//
//
//   Name:               quadratic.io
//
//   Started:            Mon Jan 20 04:55:44 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

quadratic := method(a, b, c,
  discriminant := b * b - 4 * a * c
  d := discriminant sqrt
  list((-b + d) / (2 * a),
    (-b - d) / (2 * a))
)
  
// Goldberg -- What Every Computer Scientist Should Know... pg. 162
quadraticGoldberg := method(a, b, c,
  discriminant := b * b - 4 * a * c
  d := discriminant sqrt
  if(b >= 0,
    list((2 * c) / (-b - d),
      (-b - d) / (2 * a)),
    list((-b + d) / (2 * a),
      (2 * c) / (-b + d))
  )
)
  
a := System args at(1) asNumber
b := System args at(2) asNumber
c := System args at(3) asNumber

//roots := quadratic(a, b, c)
roots := quadraticGoldberg(a, b, c)
"Root 1: #{roots at(0)}" interpolate println
"Root 2: #{roots at(1)}" interpolate println
