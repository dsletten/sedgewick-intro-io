#!/usr/local/bin/io
//
//
//   Name:               triangle.io
//
//   Started:            Mon Feb  3 20:09:59 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.12
//
//    https://en.wikipedia.org/wiki/Triangle_inequality
//
//    Explicitly: a + b > c  &  b + c > a  &  a + c > b
//    Equivalently: |a - b| < c < a + b
//    or
//    max(a, b, c) < a + b + c - max(a, b, c) => 2 max(a, b, c) < a + b + c
//    or
//    Area of triangle > 0.
//    

isValid := method(x,
  x % 1 == 0 and x > 0
)

isTriangleSedgewick := method(a, b, c,
  (a >= (b + c) or b >= (a + c) or c >= (a + b)) not
)

isTriangle := method(a, b, c,
  a < (b + c) and
  b < (a + c) and
  c < (a + b)
)

isTriangleAbs := method(a, b, c,
  (a - b) abs < c and c < (a + b)
)

isTriangleMax := method(a, b, c,
  2 * ((a max(b)) max(c)) < (a + b + c)
)

ascending := block(a, b, a > b)

// goldbergHeron := method(a, b, c,
//   heron := block(a, b, c,
//     product := (a + (b + c)) * (c - (a - b)) * (c + (a - b)) * (a + (b - c))
//     if(product < 0,
//       0,
//       (product sqrt) / 4
//     )
//   )
//   sorted := list(a, b, c) sortBy(ascending)
//   heron call(sorted at(0), sorted at(1), sorted at(2))  // apply()?????
// )

goldbergHeron := method(a, b, c,
  //
  //    Assumes a ≥ b ≥ c
  //
  heron := block(sides,
    a := sides at(0)
    b := sides at(1)
    c := sides at(2)
    product := (a + (b + c)) * (c - (a - b)) * (c + (a - b)) * (a + (b - c))
    if(product < 0,
      0,
      (product sqrt) / 4
    )
  )
  heron call(list(a, b, c) sortBy(ascending))
)

isTriangleArea := method(a, b, c,
  goldbergHeron(a, b, c) > 0
)
  
if(System args size == 4,
  a := System args at(1) asNumber
  b := System args at(2) asNumber
  c := System args at(3) asNumber

  if(isValid(a) and isValid(b) and isValid(c),
    if(isTriangleSedgewick(a, b, c),
      "True" println,
      "False" println
    )
    if(isTriangle(a, b, c),
      "True" println,
      "False" println
    )
    if(isTriangleAbs(a, b, c),
      "True" println,
      "False" println
    )
    if(isTriangleMax(a, b, c),
      "True" println,
      "False" println
    )
    if(isTriangleArea(a, b, c),
      "True" println,
      "False" println
    ),
    "Corrupt" println
  )
)

