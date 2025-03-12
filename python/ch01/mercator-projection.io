#!/usr/local/bin/io
//
//
//   Name:               mercator-projection.io
//
//   Started:            Fri Mar  7 15:36:26 2025
//
//   Synopsis:
//
//   Notes: Ex. 1.2.28
//
//
//

r := 6378137 // Earth equatorial mean radius (m) https://en.wikipedia.org/wiki/World_Geodetic_System

isValid := method(x, p,
  x isNan not and p call(x)
)

ln := method(x,
  (x log10) / ((Number constants e) log10)
)

// degreesToRadians := method(θ,
//   θ * Number constants pi / 180
// )

degreesToRadians := method(θ, θ * (Number constants pi / 180))

mercatorProjectionDegrees := method(λ₀, λ, φ,
  mercatorProjection(degreesToRadians(λ₀), degreesToRadians(λ), degreesToRadians(φ))
)

mercatorProjection := method(λ₀, λ, φ,
  list(r * (λ - λ₀), r * 0.5 * ln((1 + φ sin) / (1 - φ sin)))
)
 
if(System args size == 4,
  λ₀ := System args at(1) asNumber
  φ := System args at(2) asNumber
  λ := System args at(3) asNumber

  if(isValid(λ₀, block(λ₀, -180 <= λ₀ and λ₀ <= 180)),
    if(isValid(φ, block(φ, -90 < φ and φ < 90)),
      if(isValid(λ, block(λ, -180 <= λ and λ <= 180)),
        coords := mercatorProjectionDegrees(λ₀, λ, φ)
        ("Latitude: " .. φ .. "° Longitude: " .. λ .. "° -> ") print
        "(#{coords at(0)} m, #{coords at(1)} m)" interpolate println,
//        "Latitude: #{φ}° Longitude: #{λ}° -> (#{coords at(0)} m, #{coords at(1)} m)" interpolate println,
        "Invalid longitude: #{System args at(3)}" interpolate println
      ),
      "Invalid latitude: #{System args at(2)}" interpolate println
    ),
    "Invalid center: #{System args at(1)}" interpolate println
  )
)

