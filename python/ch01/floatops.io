#!/usr/local/bin/io
//
//
//   Name:               floatops.io
//
//   Started:            Sun Jan 19 04:04:44 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

a := System args at(1) asNumber
b := System args at(2) asNumber

sum := a + b
difference := a - b
product := a * b
quotient := a / b
remainder := a % b // a mod(b)
power := a ** b // a pow(b)

"#{a} + #{b} = #{sum}" interpolate println
"#{a} - #{b} = #{difference}" interpolate println
"#{a} * #{b} = #{product}" interpolate println
"#{a} / #{b} = #{quotient}" interpolate println
"#{a} % #{b} = #{remainder}" interpolate println
"#{a} ** #{b} = #{power}" interpolate println
