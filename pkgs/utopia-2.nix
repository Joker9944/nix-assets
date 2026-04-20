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
    url = "https://cdn.myportfolio.com/9ca8cb4e3b7ad5cc63eaddb0c7524886/80dc01c5-5246-46cc-aa66-652ceafbe33f.jpg?h=5ffa8501bfb3a4f0e6fe954553dcf284";
    sha256 = "sha256-JmdGfEYhsm6FBO40bC44ANJrS/Rkok795ESJUOv4Hmo=";
  };

  type = "backgrounds";
  filetype = "jpg";

  meta = {
    homepage = "https://kohlhuber.net/utopia";
    license = lib.licenses.unfree;
  };
}
