{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "an-aerial-view-of-a-city-at-night";
  version = "1.0.0";

  type = "backgrounds";
  filetype = "jpg";

  meta = {
    homepage = "https://unsplash.com/photos/an-aerial-view-of-a-city-at-night-JBkwaYMuhdc";
    license = lib.licenses.unfree;
  };
}
