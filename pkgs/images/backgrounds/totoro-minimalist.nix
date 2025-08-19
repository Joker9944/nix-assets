{
  lib,
  pkgs,
  assetsDir,
  ...
}: let
  mkImageDerivation = resolution:
    pkgs.stdenv.mkDerivation rec {
      pname = "totoro-minimalist";
      version = "1.0.0";

      meta.description = "${pname} resized to ${resolution}.";

      src = lib.path.append assetsDir "images/backgrounds/${pname}";

      dontBuild = true;
      dontConfigure = true;

      installPhase = ''
        mkdir -p $out/share/backgrounds
        cp $src/${pname}.${resolution}.png $out/share/backgrounds/
      '';
    };
in
  lib.attrsets.listToAttrs (
    lib.lists.map (resolution: {
      name = resolution;
      value = mkImageDerivation resolution;
    }) [
      "1920x1080"
      "2560x1440"
      "3840x2160"
    ]
  )
