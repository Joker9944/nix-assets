{
  lib,
  imagemagick,
  custom,
  ...
}:
lib.extendMkDerivation {
  constructDrv = custom.helpers.buildImageModule;
  extendDrvArgs =
    finalAttrs:
    {
      imageBinary,
      gravity ? "North",
      crop ? "16:9",
      ...
    }:
    {
      inherit gravity crop;

      src = imageBinary;

      nativeBuildInputs = lib.toList imagemagick;

      dontUnpack = true;

      buildPhase = ''
        runHook preBuild

        magick $src \
          -type TrueColor \
          -gravity ${finalAttrs.gravity} \
          -crop ${finalAttrs.crop} \
          -resize ${finalAttrs.resolution} \
          ${finalAttrs.pname}.${finalAttrs.resolution}.${finalAttrs.filetype}

        runHook postBuild
      '';
    };
}
