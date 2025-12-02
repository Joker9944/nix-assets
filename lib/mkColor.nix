{ lib, ... }:
let
  mkColor =
    color:
    let
      toHex = lib.pipe color [
        (lib.map (rgb: (lib.optionalString (rgb < 16) "0") + (lib.toHexString rgb)))
        lib.concatStrings
      ];

      toRgb = lib.pipe color [
        (lib.map toString)
        (lib.concatStringsSep ",")
      ];
    in
    if lib.isAttrs color then
      lib.mapAttrs (_: mkColor) color
    else
      {
        hex = "#${toHex}";
        rgb = "rgb(${toRgb})";
        rgba = alpha: "rgba(${toRgb},${toString alpha})";
      };
in
mkColor
