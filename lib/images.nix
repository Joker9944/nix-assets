{
  lib,
  assetsDir,
}: rec {
  mkExternalImageDerivation = {
    pname,
    type,
    url,
    sha256,
    gravity ? "North",
    crop ? "16:9",
    resolution,
    pkgs,
  }:
    pkgs.stdenv.mkDerivation {
      inherit pname;
      version = "1.0.0";

      src = pkgs.fetchurl {
        inherit url sha256;
      };

      nativeBuildInputs = [pkgs.imagemagick];

      dontUnpack = true;

      installPhase = ''
        mkdir -p $out/share/${type}
        magick $src \
          -type TrueColor \
          -gravity ${gravity} \
          -crop ${crop} \
          -resize ${resolution} \
          $out/share/${type}/${pname}.${resolution}.jpeg
      '';

      meta.description = "${pname} cropped to ${resolution}.";
    };

  mkInternalImageDerivation = {
    pname,
    type,
    filetype ? "png",
    resolution,
    pkgs,
  }:
    pkgs.stdenv.mkDerivation {
      inherit pname;
      version = "1.0.0";

      src = lib.path.append assetsDir "images/${type}/${pname}";

      dontBuild = true;
      dontConfigure = true;

      installPhase = ''
        mkdir -p $out/share/${type}
        cp $src/${pname}.${resolution}.${filetype} $out/share/${type}/
        if [[ -e "$src/NOTICE" ]]; then
          cp $src/NOTICE $out/share/${type}/
        fi
      '';

      meta.description = "${pname} in ${resolution}.";
    };

  mkImageDerivationSet = {
    pname,
    url ? null,
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
        value =
          if url != null
          then mkExternalImageDerivation (derivationArgs // definition)
          else mkInternalImageDerivation (derivationArgs // definition);
      })
      definitions
    );
}
