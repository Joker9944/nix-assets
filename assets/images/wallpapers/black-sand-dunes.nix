{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "black-sand-dunes";
  version = "1.0.0";

  meta.description = "${pname} from Pexels cropped to 4k.";

  src = pkgs.fetchurl {
    url = "https://images.pexels.com/photos/2387793/pexels-photo-2387793.jpeg";
    sha256 = "sha256-2S9foYfeuFQOPA+Nqkk7Zvlcz+P9mOBzUQ+I4+kLeAc=";
  };

  nativeBuildInputs = [pkgs.imagemagick];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/backgrounds
    magick $src \
      -type TrueColor \
      -resize 3840x2160^ \
      -crop 3840x2160+0+0 \
      $out/share/backgrounds/${pname}.3840x2160.jpeg
  '';
}
