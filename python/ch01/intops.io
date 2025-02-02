#!/usr/local/bin/io
//
//
//   Name:               intops.io
//
//   Started:            Thu Jan 16 02:30:06 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

a := System args at(1) asNumber floor
b := System args at(2) asNumber floor

sum := a + b
difference := a - b
product := a * b
//quotient := a / b
quotient := (a / b) floor
remainder := a % b // a mod(b)
power := a ** b // a pow(b)

"#{a} + #{b} = #{sum}" interpolate println
"#{a} - #{b} = #{difference}" interpolate println
"#{a} * #{b} = #{product}" interpolate println
"#{a} / #{b} = #{quotient}" interpolate println
"#{a} % #{b} = #{remainder}" interpolate println
"#{a} ** #{b} = #{power}" interpolate println
