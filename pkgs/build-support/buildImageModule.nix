{ lib, stdenv, ... }:
lib.extendMkDerivation {
  constructDrv = stdenv.mkDerivation;
  extendDrvArgs =
    finalAttrs:
    {
      type,
      filetype ? "png",
      resolution,
      ...
    }:
    {
      inherit type filetype resolution;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/share/${finalAttrs.type}
        cp ${finalAttrs.pname}.${finalAttrs.resolution}.${filetype} $out/share/${finalAttrs.type}/
        if [[ -e NOTICE ]]; then
          cp NOTICE $out/share/${finalAttrs.type}/
        fi

        runHook postInstall
      '';

      meta.description = "${finalAttrs.pname} in ${finalAttrs.resolution}.";
    };
}
