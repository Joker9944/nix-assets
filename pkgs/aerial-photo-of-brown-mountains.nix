{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "aerial-photo-of-brown-mountains";
  version = "1.0.0";

  type = "backgrounds";
  filetype = "jpg";

  meta = {
    homepage = "https://unsplash.com/photos/aerial-photo-of-brown-moutains-JgOeRuGD_Y4";
    license = lib.licenses.unfree;
  };
}
