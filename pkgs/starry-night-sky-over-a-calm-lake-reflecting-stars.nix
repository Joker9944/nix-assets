{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "starry-night-sky-over-a-calm-lake-reflecting-stars";
  version = "1.0.0";

  type = "backgrounds";
  filetype = "jpg";

  meta = {
    homepage = "https://github.com/dracula/wallpaper";
    license = lib.licenses.mit;
  };
}
