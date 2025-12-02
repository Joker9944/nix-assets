{ lib, ... }:
helpers:
{
  version ? "1.0.0",
  imageBinary ? null,
  definitions ? [
    { resolution = "1920x1080"; }
    { resolution = "2560x1440"; }
    { resolution = "3840x2160"; }
  ],
  ...
}@args:
lib.pipe definitions [
  (lib.map (definition: {
    name = definition.resolution;
    value =
      let
        unpacked =
          (lib.removeAttrs args (lib.toList "definitions"))
          // {
            # Pass potentially unset defaults
            inherit version;
          }
          // definition;
      in
      if imageBinary == null then
        helpers.buildProvidedImageModule unpacked
      else
        helpers.buildExternalImageModule unpacked;
  }))
  lib.listToAttrs
]
