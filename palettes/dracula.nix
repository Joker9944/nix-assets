# Color palette based on https://draculatheme.com/spec
{utility, ...}:
with utility.custom; rec {
  foreground = white.dull;
  cursor = white.dull;
  background = {
    lighter = mkColor "ECE9DF";
    light = mkColor "DEDCCF";
    normal = mkColor "282A36";
    dark = mkColor "CECCC0";
    darker = mkColor "BCBAB3";
  };
  black = mkColorBrightnessTuple {
    dull = "21222C";
    bright = "6272A4";
  };
  red = mkColorBrightnessTuple {
    dull = "FF5555";
    bright = "FF6E6E";
  };
  green = mkColorBrightnessTuple {
    dull = "50FA7B";
    bright = "69FF94";
  };
  yellow = mkColorBrightnessTuple {
    dull = "F1FA8C";
    bright = "FFFFA5";
  };
  blue = mkColorBrightnessTuple {
    dull = "BD93F9";
    bright = "D6ACFF";
  };
  magenta = mkColorBrightnessTuple {
    dull = "FF79C6";
    bright = "FF92DF";
  };
  cyan = mkColorBrightnessTuple {
    dull = "8BE9FD";
    bright = "A4FFFF";
  };
  white = mkColorBrightnessTuple {
    dull = "F8F8F2";
    bright = "FFFFFF";
  };
  functional = {
    danger = mkColor "DE5735";
    warning = mkColor "A39514";
    success = mkColor "089108";
    info = mkColor "0081D6";
    focus = mkColor "815CD6";
  };
  highlights = {
    line = black.bright;
    text = mkColor "44475A";
    interactive = mkColor "343746";
  };
}
