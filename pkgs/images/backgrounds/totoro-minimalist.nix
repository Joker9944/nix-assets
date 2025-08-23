{
  pkgs,
  utility,
  ...
}:
utility.custom.mkImageDerivationSet {
  inherit pkgs;
  pname = "totoro-minimalist";
  type = "backgrounds";
} { }
