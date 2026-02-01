{
  lib,
  fetchurl,
  imageTools,
  ...
}:
imageTools.buildExternalImageModule {
  pname = "misty-forest-with-pine-trees-in-fog";
  version = "1.1.0";

  src = fetchurl {
    url = "https://images.pexels.com/photos/31979792/pexels-photo-31979792.jpeg";
    sha256 = "sha256-MJe0ABa4r3b6z4V4Yz8Z0fJ93aRKqdb+WpphF7VHAg8=";
  };

  type = "backgrounds";
  filetype = "jpeg";

  gravity = "South";

  meta = {
    homepage = "https://www.pexels.com/photo/misty-forest-with-pine-trees-in-fog-31979792/";
    license = lib.licenses.unfree;
  };
}
