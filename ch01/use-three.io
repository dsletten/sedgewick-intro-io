#!/usr/local/bin/io
//
//
//   Name:               use-three.io
//
//   Started:            Thu Jan  2 22:45:32 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

commifyList := method(words,
  if(words size == 0,
    "",
    if(words size == 1,
      words at (0),
      if(words size == 2,
        "#{words at (0)} and #{words at (1)}" interpolate,
        words slice(0, words size - 1) join(", ") .. ", and " .. words last
      )
    )
  )
)

if(System args rest size == 0,
  "Nothing to see here." println,
  "Hi #{commifyList(System args rest reverse)}." interpolate println
)

