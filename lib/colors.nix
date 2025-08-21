{lib, ...}: rec {
  mkColorBrightnessTuple = {
    dull,
    bright,
  }: {
    dull = mkColor dull;
    bright = mkColor bright;
  };

  mkColor = color: let
    toHex = lib.concatStrings (lib.map lib.toHexString color);
    toRgb = lib.concatStringsSep "," (lib.map toString color);
  in {
    hex = "#${toHex}";
    rgb = "rgb(${toRgb})";
    rgba = alpha: "rgba(${toRgb},${toString alpha})";
  };
}
