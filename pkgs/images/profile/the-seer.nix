{ custom, ... }:
custom.lib.mkImageModules custom.helpers {
  pname = "the-seer";
  type = "profile";
  filetype = "jpg";
  definitions = [
    { resolution = "512x512"; }
    { resolution = "1200x1200"; }
  ];
}
