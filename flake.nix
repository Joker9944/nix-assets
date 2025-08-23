{
  description = "nix-assets";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils/main"; # cSpell:ignore numtide
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;

      utility.custom =
        (import ./lib/images.nix {
          inherit lib;
          assetsDir = ./assets;
        })
        // (import ./lib/colors.nix { inherit lib; });
    in
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages =
          let
            createPkgsRecursive =
              dir:
              lib.attrsets.listToAttrs (
                lib.lists.map
                  (entry: {
                    name = lib.strings.removeSuffix ".nix" entry.name;
                    value =
                      if entry.value == "directory" then
                        createPkgsRecursive (lib.path.append dir entry.name)
                      else
                        pkgs.callPackage (lib.path.append dir entry.name) { inherit utility; };
                  })
                  (
                    lib.attrsets.attrsToList (
                      lib.attrsets.filterAttrs (
                        filename: filetype: filetype == "directory" || lib.strings.hasSuffix ".nix" filename
                      ) (builtins.readDir dir)
                    )
                  )
              );
          in
          createPkgsRecursive ./pkgs;

        devShells.default = pkgs.mkShell {
          inherit (self.checks.${system}.preCommitHooksCheck) shellHook;
          buildInputs = self.checks.${system}.preCommitHooksCheck.enabledPackages;
        };

        checks = {
          preCommitHooksCheck = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              trim-trailing-whitespace.enable = true;
              end-of-file-fixer.enable = true;
              fix-byte-order-marker.enable = true;
              mixed-line-endings = {
                enable = true;
                args = [ "--fix=lf" ];
              };
              cspell.enable = true;
              nixfmt-rfc-style.enable = true;
              nil.enable = true;
              statix.enable = true;
            };
          };
        };

        formatter = pkgs.treefmt.withConfig {
          runtimeInputs = [ pkgs.nixfmt-rfc-style ];

          settings = {
            on-unmatched = "info";

            formatter.nixfmt = {
              command = "nixfmt";
              includes = [ "*.nix" ];
            };
          };
        };
      }
    )
    // {
      overlays.assets = final: prev: {
        custom = lib.attrsets.recursiveUpdate (lib.attrsets.optionalAttrs (prev ? custom) prev.custom) {
          assets = self.packages.${prev.system};
        };
      };

      palettes = {
        dracula = import ./palettes/dracula.nix { inherit utility; };
      };
    };
}
