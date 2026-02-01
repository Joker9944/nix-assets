{ lib, imageTools, ... }:
imageTools.buildProvidedImageModule {
  pname = "the-seer";
  version = "1.1.0";

  type = "profile";
  filetype = "jpg";
  resolution = "1200x1200";

  meta = {
    homepage = "https://www.deviantart.com/scary-panda/art/the-seer-704744067";
    license = lib.licenses.unfree;
  };
}
