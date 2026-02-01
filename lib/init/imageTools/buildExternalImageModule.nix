{
  lib,
  imagemagick,
  buildImageModule,
  ...
}:
lib.extendMkDerivation {
  constructDrv = buildImageModule;
  extendDrvArgs =
    finalAttrs:
    {
      gravity ? "North",
      crop ? "16:9",
      ...
    }:
    {
      inherit gravity crop;

      nativeBuildInputs = [ imagemagick ];

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
