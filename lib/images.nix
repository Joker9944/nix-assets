{
  lib,
}: rec {
  mkImageDerivation = {
    pname,
    url,
    sha256,
    gravity ? "North",
    crop ? "16:9",
    resolution,
    pkgs,
  } @ args:
    pkgs.stdenv.mkDerivation rec {
      inherit pname;
      version = "1.0.0";

      src = pkgs.fetchurl {
        inherit url sha256;
      };

      nativeBuildInputs = [pkgs.imagemagick];

      dontUnpack = true;

      installPhase = ''
        mkdir -p $out/share/backgrounds
        magick $src \
          -type TrueColor \
          -gravity ${gravity} \
          -crop ${crop} \
          -resize ${resolution} \
          $out/share/backgrounds/${pname}.${resolution}.jpeg
      '';

      meta.description = "${pname} cropped to ${resolution}.";
    };

  mkImageDerivationSet = {
    pname,
    url,
    sha256,
    ...
  } @ derivationArgs: {
    definitions ? [
      {resolution = "1920x1080";}
      {resolution = "2560x1440";}
      {resolution = "3840x2160";}
    ],
  } @ args:
    lib.attrsets.listToAttrs (
      lib.lists.map (definition: {
        name = definition.resolution;
        value = mkImageDerivation (derivationArgs // definition);
      })
      definitions
    );
}
