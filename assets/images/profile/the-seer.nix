{pkgs, ...}: let
  mkTheSeerDerivation = resolution: pkgs.stdenv.mkDerivation rec {
    pname = "the-seer";
    version = "1.0.0";

    meta.description = "${pname} by scary-PANDA cropped to ${resolution} for avatar usage.";

    src = ./.;

    dontBuild = true;
    dontConfigure = true;

    installPhase = ''
      mkdir -p $out/share/avatars
      cp $src/the-seer.avatar.${resolution}.jpg $out/share/avatars/
      cp $src/NOTICE $out/share/avatars/
    '';
  };
in {
  "512x512" = mkTheSeerDerivation "512x512";
  "1100x1100" = mkTheSeerDerivation "512x512";
}
