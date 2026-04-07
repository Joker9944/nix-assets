{ lib, stdenv, ... }:
lib.extendMkDerivation {
  constructDrv = stdenv.mkDerivation;
  extendDrvArgs =
    finalAttrs:
    {
      type,
      filetype ? "png",
      resolution ? "3840x2160",
      ...
    }:
    {
      inherit type filetype resolution;

      outputs = [
        "out"
        "notice"
      ];

      installPhase = ''
        runHook preInstall

        cp ${finalAttrs.pname}.${finalAttrs.resolution}.${filetype} $out

        mkdir $notice
        if [[ -e NOTICE ]]; then
          cp NOTICE $notice/
        fi

        runHook postInstall
      '';

      meta.description = "${finalAttrs.pname} in ${finalAttrs.resolution}.";
    };
}
