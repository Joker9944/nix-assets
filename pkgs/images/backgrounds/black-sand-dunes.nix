{ pkgs, custom, ... }:
custom.lib.mkImageModules custom.helpers {
  pname = "black-sand-dunes";
  type = "backgrounds";
  filetype = "jpeg";
  imageBinary = pkgs.fetchurl {
    url = "https://images.pexels.com/photos/2387793/pexels-photo-2387793.jpeg";
    sha256 = "sha256-2S9foYfeuFQOPA+Nqkk7Zvlcz+P9mOBzUQ+I4+kLeAc=";
  };
}
