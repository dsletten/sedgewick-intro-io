#!/usr/local/bin/io
//
//
//   Name:               day-of-week.io
//
//   Started:            Fri Feb 28 09:43:21 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.26
//
//
//

isValid := method(x, p,
  x isNan not and
  x % 1 == 0 and
  p call(x)
)

isLeapYear := method(y,
  if(y % 400 == 0,
    true,
    if(y % 100 == 0,
      false,
      y % 4 == 0
    )
  )
)

monthLength := method(m, y,
  if(list(4, 6, 9, 11) contains(m),
    30,
    if(m == 2,
      if(isLeapYear(y), 29, 28),
      31
    )
  )
)

isValidDay := method(d, m, y,
  1 <= d and d <= monthLength(m, y)
)

getDayOfWeekName := method(d,
  list("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday") at((d + 6) % 7)
)

dayOfWeek := method(d, m, y,
  y0 := y - ((14 - m) / 12) floor
  x := y0 + (y0 / 4) floor - (y0 / 100) floor + (y0 / 400) floor
  m0 := m + 12 * ((14 - m) / 12) floor - 2

  (d + x + (31 * m0 / 12) floor) % 7
)

if(System args size == 4,
  m := System args at(1) asNumber
  d := System args at(2) asNumber
  y := System args at(3) asNumber
 
  if(isValid(m, block(m, 1 <= m and m <= 12)),
    if(isValid(y, block(y, y >= 1582)),
      if(isValid(d, block(d, isValidDay(d, m, y))),
        dow := dayOfWeek(d, m, y)
        "#{dow} (#{getDayOfWeekName(dow)})" interpolate println,
        "Invalid day: #{System args at(2)}" interpolate println
      ),
      "Invalid year: #{System args at(3)}" interpolate println
    ),
    "Invalid month: #{System args at(1)}" interpolate println
  )
)

