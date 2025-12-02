{ custom, ... }:
custom.lib.mkImageModules custom.helpers {
  pname = "dracula-leaves-dark";
  type = "backgrounds";
  definitions = [
    { resolution = "1920x1080"; }
    { resolution = "2560x1440"; }
    { resolution = "3440x1400"; }
  ];
}
