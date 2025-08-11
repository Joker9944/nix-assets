{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "misty-forest-with-pine-trees-in-fog";
  version = "1.0.0";

  meta.description = "${pname} from Pexels cropped to 4k.";

  src = pkgs.fetchurl {
    url = "https://images.pexels.com/photos/31979792/pexels-photo-31979792.jpeg";
    sha256 = "sha256-MJe0ABa4r3b6z4V4Yz8Z0fJ93aRKqdb+WpphF7VHAg8=";
  };

  nativeBuildInputs = [pkgs.imagemagick];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/backgrounds
    magick $src \
      -type TrueColor \
      -resize 3840x2160^ \
      -crop 3840x2160+0+400 \
      $out/share/backgrounds/${pname}.3840x2160.jpeg
  '';
}
