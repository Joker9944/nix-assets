{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "dracula-leaves-dark";
  version = "1.1.0";

  resolution = "3440x1440";
  type = "backgrounds";

  meta = {
    homepage = "https://github.com/dracula/wallpaper";
    license = lib.licenses.mit;
  };
}
