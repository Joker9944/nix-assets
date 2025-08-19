{
  lib,
  pkgs,
  assetsDir,
  ...
}: let
  mkTheSeerDerivation = resolution:
    pkgs.stdenv.mkDerivation rec {
      pname = "the-seer";
      version = "1.0.0";

      meta.description = "${pname} by scary-PANDA cropped to ${resolution} for avatar usage.";

      src = lib.path.append assetsDir "images/profile/${pname}";

      dontBuild = true;
      dontConfigure = true;

      installPhase = ''
        mkdir -p $out/share/avatars
        cp $src/${pname}.avatar.${resolution}.jpg $out/share/avatars/
        cp $src/NOTICE $out/share/avatars/
      '';
    };
in
  lib.attrsets.listToAttrs (
    lib.lists.map (resolution: {
      name = resolution;
      value = mkTheSeerDerivation resolution;
    }) [
      "512x512"
      "1200x1200"
    ]
  )
