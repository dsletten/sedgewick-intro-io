#!/usr/local/bin/io
//
//
//   Name:               parabola.io
//
//   Started:            Fri Jan 24 17:17:02 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

calculateRoots := method(a, b, c,
  discriminant := b * b - 4 * a * c
  d := discriminant sqrt
  if(b >= 0,
    list((2 * c) / (-b - d),
      (-b - d) / (2 * a)),
    list((-b + d) / (2 * a),
      (2 * c) / (-b + d))
  )
)

Parabola := Object clone do(
  // a ::= 0
  // b ::= 0
  // c ::= 0

  init := method(x, y, z,
    self a := x
    self b := y
    self c := z
    roots := calculateRoots(x, y, z)
    self root1 := roots at(0)
    self root2 := roots at(1)
  )
//  init
)

// Stack := Object clone do(
//   // state
//   contents ::= list();
  
//   // constructor
//   init := method(
//     contents = list()
//   );
  
//   // methods
//   push := method(n,
//     self contents prepend(n);
//     self
//   );
  
//   top := method(
//     self contents first
//   );
  
//   pop := method(
//     val := self contents first;
//     self setContents(self contents rest);
//     val
//   );
  
//   size := method(
//     self contents size
//   )
// )