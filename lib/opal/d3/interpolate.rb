module D3
  class << self
    alias_d3 :interpolate_number, :interpolateNumber
    alias_d3 :interpolate_round, :interpolateRound
    alias_d3 :interpolate_string, :interpolateString
    alias_d3 :interpolate_array, :interpolateArray
    alias_d3 :interpolate_date, :interpolateDate

    # These should support gamma
    alias_d3 :interpolate_rgb, :interpolateRgb
    alias_d3 :interpolate_rgb_basis, :interpolateRgbBasis
    alias_d3 :interpolate_rgb_basis_closed, :interpolateRgbBasisClosed
    alias_d3 :interpolate_hsl, :interpolateHsl
    alias_d3 :interpolate_hsl_long, :interpolateHslLong
    alias_d3 :interpolate_lab, :interpolateLab
    alias_d3 :interpolate_hcl, :interpolateHcl
    alias_d3 :interpolate_hcl_long, :interpolateHclLong
    alias_d3 :interpolate_cubehelix, :interpolateCubehelix
    alias_d3 :interpolate_cubehelix_long, :interpolateCubehelixLong
  end
end
