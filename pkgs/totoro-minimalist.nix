{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "totoro-minimalist";
  version = "1.1.0";

  type = "backgrounds";

  meta = {
    homepage = "https://4kwallpapers.com/black-dark/totoro-minimalist-20906.html";
    license = lib.licenses.unfree;
  };
}
