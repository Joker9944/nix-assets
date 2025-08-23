{
  pkgs,
  utility,
  ...
}:
utility.custom.mkImageDerivationSet
  {
    inherit pkgs;
    pname = "dracula-leaves-dark";
    type = "backgrounds";
  }
  {
    definitions = [
      { resolution = "1920x1080"; }
      { resolution = "2560x1440"; }
      { resolution = "3440x1400"; }
    ];
  }
