{
  lib,
  custom,
  ...
}:
lib.extendMkDerivation {
  constructDrv = custom.helpers.buildImageModule;
  extendDrvArgs =
    finalAttrs:
    {
      pname,
      type ? "png",
      context ? ../../assets,
      ...
    }:
    {
      src = lib.path.append context "images/${type}/${pname}";

      dontConfigure = true;

      buildPhase = ''
        runHook preBuild

        cp -r $src/* .

        runHook postBuild
      '';
    };
}
