#!/usr/local/bin/io
//
//
//   Name:               gaussian-random.io
//
//   Started:            Sun Feb 23 20:24:09 2025
//
//   Synopsis:
//
//   Notes:
//
//
//

// D'oh!
// gaussian-random.io; gaussian-random.io; gaussian-random.io
// Uniform (0.8773306866642088,0.6795455433893949) -> Gaussian (-0.2191529629774988,-0.4622927240154392
// Uniform (0.8773306866642088,0.6795455433893949) -> Gaussian (-0.2191529629774988,-0.4622927240154392
// Uniform (0.8773306866642088,0.6795455433893949) -> Gaussian (-0.2191529629774988,-0.4622927240154392

ln := method(x,
  (x log10) / ((Number constants e) log10)
)

// log is broken!!
// boxMuller := method(u, v,
//   if(u == 0,
//     "Box-Muller does not abide zero values for u." println,
//     // list((2 * Number constants pi * v) cos * ((-2 * (u log)) sqrt),
//     //   (2 * Number constants pi * v) sin * ((-2 * (u log)) sqrt))
//     list((2 * Number constants pi * v) cos * ((-2 * ln(u)) sqrt),
//       (2 * Number constants pi * v) sin * ((-2 * ln(u)) sqrt))
//   )
// )

boxMuller := method(u, v,
  if(u == 0,
    "Box-Muller does not abide zero values for u." println,
    r := (-2 * ln(u)) sqrt
    theta := 2 * Number constants pi * v

    list(r * (theta cos), r * (theta sin))
  )
)

Random setSeed(Date clone now asNumber)
u := Random value
v := Random value

gaussian := boxMuller(u, v)
"Uniform (#{u},#{v}) -> Gaussian (#{gaussian at(0)},#{gaussian at(1)}" interpolate println
