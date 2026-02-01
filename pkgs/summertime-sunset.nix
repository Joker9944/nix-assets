{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "summertime-sunset";
  version = "1.1.0";

  type = "backgrounds";

  meta = {
    homepage = "https://www.deviantart.com/oviotti/art/Summertime-Wallpapers-800960664";
    license = lib.licenses.unfree;
  };
}
