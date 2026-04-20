{
  lib,
  fetchurl,
  imageTools,
  ...
}:
imageTools.buildExternalImageModule {
  pname = "utopia-2";
  version = "1.0.0";

  src = fetchurl {
    url = "https://cdn.myportfolio.com/9ca8cb4e3b7ad5cc63eaddb0c7524886/75c794e0-f5cb-4065-9f27-26df18262d13.jpg?h=63a33c1c1d356339e31f811fe4ef0e82";
    sha256 = "sha256-ok7BRx3R6+IVNjF/0RR9kupb+9RI758wYL+iuJE6UCY=";
  };

  type = "backgrounds";
  filetype = "jpg";

  meta = {
    homepage = "https://kohlhuber.net/utopia";
    license = lib.licenses.unfree;
  };
}
