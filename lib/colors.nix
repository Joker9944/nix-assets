{...}: rec {
  mkColorBrightnessTuple = {
    dull,
    bright,
  }: {
    dull = mkColor dull;
    bright = mkColor bright;
  };

  mkColor = color: {
    hex = "#${color}";
    rgb = "rgb(${color})";
    rgba = alpha: "rgba(${color}${alpha})";
  };
}
