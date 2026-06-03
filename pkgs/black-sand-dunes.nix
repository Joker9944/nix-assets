{
  lib,
  fetchurl,
  imageTools,
  ...
}:
imageTools.buildExternalImageModule {
  pname = "black-sand-dunes";
  version = "1.1.0";

  src = fetchurl {
    url = "https://images.pexels.com/photos/2387793/pexels-photo-2387793.jpeg";
    sha256 = "sha256-Rp/Rm6joffisrg1aM5IqJiC6V6Gw4hNzf0vF0ecD+P4=";
  };

  type = "backgrounds";
  filetype = "jpeg";

  meta = {
    homepage = "https://www.pexels.com/photo/black-sand-dunes-2387793/";
    license = lib.licenses.unfree;
  };
}
