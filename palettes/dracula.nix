# Color palette based on https://spec.draculatheme.com/
{ lib, custom, ... }:
let
  inherit (custom.lib) mkColor;
in
lib.fix (self: {
  foreground = self.white.dull;
  cursor = self.white.dull;
  background = {
    lighter = mkColor [
      66
      68
      80
    ];
    light = mkColor [
      52
      55
      70
    ];
    normal = mkColor [
      40
      42
      54
    ];
    dark = mkColor [
      33
      34
      44
    ];
    darker = mkColor [
      25
      26
      33
    ];
  };
  black = mkColor {
    dull = [
      33
      34
      44
    ];
    bright = [
      98
      114
      164
    ];
  };
  red = mkColor {
    dull = [
      255
      85
      85
    ];
    bright = [
      255
      110
      110
    ];
  };
  green = mkColor {
    dull = [
      80
      250
      123
    ];
    bright = [
      105
      255
      148
    ];
  };
  yellow = mkColor {
    dull = [
      241
      250
      140
    ];
    bright = [
      255
      255
      165
    ];
  };
  blue = mkColor {
    dull = [
      189
      147
      249
    ];
    bright = [
      214
      172
      255
    ];
  };
  magenta = mkColor {
    dull = [
      255
      121
      198
    ];
    bright = [
      255
      146
      223
    ];
  };
  cyan = mkColor {
    dull = [
      139
      233
      253
    ];
    bright = [
      164
      255
      255
    ];
  };
  white = mkColor {
    dull = [
      248
      248
      242
    ];
    bright = [
      255
      255
      255
    ];
  };
  functional = {
    danger = mkColor [
      222
      87
      53
    ];
    warning = mkColor [
      163
      149
      20
    ];
    success = mkColor [
      8
      145
      8
    ];
    info = mkColor [
      0
      129
      214
    ];
    focus = mkColor [
      129
      92
      214
    ];
  };
  highlights = {
    line = self.black.bright;
    text = mkColor [
      68
      71
      90
    ];
    interactive = mkColor [
      52
      55
      70
    ];
  };
})
