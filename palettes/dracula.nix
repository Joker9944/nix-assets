# Color palette based on https://spec.draculatheme.com/
{utility, ...}:
with utility.custom; rec {
  foreground = white.dull;
  cursor = white.dull;
  background = {
    lighter = mkColor [66 68 80];
    light = mkColor [52 55 70];
    normal = mkColor [40 42 54];
    dark = mkColor [33 34 44];
    darker = mkColor [25 26 33];
  };
  black = mkColorBrightnessTuple {
    dull = [33 34 44];
    bright = [98 114 164];
  };
  red = mkColorBrightnessTuple {
    dull = [255 85 85];
    bright = [255 110 110];
  };
  green = mkColorBrightnessTuple {
    dull = [80 250 123];
    bright = [105 255 148];
  };
  yellow = mkColorBrightnessTuple {
    dull = [241 250 140];
    bright = [255 255 165];
  };
  blue = mkColorBrightnessTuple {
    dull = [189 147 249];
    bright = [214 172 255];
  };
  magenta = mkColorBrightnessTuple {
    dull = [255 121 198];
    bright = [255 146 223];
  };
  cyan = mkColorBrightnessTuple {
    dull = [139 233 253];
    bright = [164 255 255];
  };
  white = mkColorBrightnessTuple {
    dull = [248 248 242];
    bright = [255 255 255];
  };
  functional = {
    danger = mkColor [222 87 53];
    warning = mkColor [163 149 20];
    success = mkColor [8 145 8];
    info = mkColor [0 129 214];
    focus = mkColor [129 92 214];
  };
  highlights = {
    line = black.bright;
    text = mkColor [68 71 90];
    interactive = mkColor [52 55 70];
  };
}
