{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "the-seer";
  version = "1.0.0";

  meta.description = "${pname} by scary-PANDA cropped for avatar usage.";

  src = ./.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/avatars
    cp $src/the-seer.avatar.512x512.jpg $out/share/avatars/
    cp $src/the-seer.avatar.1100x1100.jpg $out/share/avatars/
  '';
}
