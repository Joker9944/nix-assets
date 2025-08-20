{
  pkgs,
  utility,
  ...
}:
utility.custom.mkImageDerivationSet {
  inherit pkgs;
  pname = "the-seer";
  type = "profile";
  filetype = "jpg";
} {
  definitions = [
    {resolution = "512x512";}
    {resolution = "1200x1200";}
  ];
}
