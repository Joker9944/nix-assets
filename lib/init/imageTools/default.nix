{ lib, pkgs, ... }:
lib.fix (self: {
  buildImageModule = pkgs.callPackage ./buildImageModule.nix { };

  buildExternalImageModule = pkgs.callPackage ./buildExternalImageModule.nix {
    inherit (self) buildImageModule;
  };

  buildProvidedImageModule = pkgs.callPackage ./buildProvidedImageModule.nix {
    inherit (self) buildImageModule;
  };
})
