{ lib, buildImageModule, ... }:
lib.extendMkDerivation {
  constructDrv = buildImageModule;
  extendDrvArgs =
    finalAttrs:
    {
      pname,
      type ? "png",
      ...
    }:
    {
      src = lib.path.append ../../../assets "images/${finalAttrs.type}/${finalAttrs.pname}";

      dontConfigure = true;

      buildPhase = ''
        runHook preBuild

        cp -r $src/* .

        runHook postBuild
      '';
    };
}
