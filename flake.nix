{
  description = "nix-assets";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils/main";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      inherit (nixpkgs) lib;
      pkgs = nixpkgs.legacyPackages.${system};

      createPkgsRecursive = dir:
        lib.attrsets.listToAttrs (
          lib.lists.map (entry: {
            name = lib.strings.removeSuffix ".nix" entry.name;
            value =
              if entry.value == "directory"
              then createPkgsRecursive (lib.path.append dir entry.name)
              else pkgs.callPackage (lib.path.append dir entry.name) {};
          })
          (lib.attrsets.attrsToList (lib.attrsets.filterAttrs (filename: filetype: filetype == "directory" || lib.strings.hasSuffix ".nix" filename) (builtins.readDir dir)))
        );
    in {
      packages = createPkgsRecursive ./assets;

      formatter = pkgs.alejandra;
    });
}
