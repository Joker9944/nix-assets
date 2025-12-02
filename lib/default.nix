{ lib, ... }@args:
lib.fix (
  self:
  let
    argsWithSelf = args // {
      inherit self;
    };
  in
  lib.pipe ./. [
    builtins.readDir
    (lib.filterAttrs (filename: _: filename != "default.nix"))
    lib.attrNames
    (lib.map (filename: {
      name = lib.removeSuffix ".nix" filename;
      value = import (lib.path.append ./. filename) argsWithSelf;
    }))
    lib.listToAttrs
  ]
)
