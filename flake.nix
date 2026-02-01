{
  description = "nix-assets";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
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
    in
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        custom.lib = self.lib.init pkgs;
      in
      {
        packages = lib.pipe ./pkgs [
          builtins.readDir
          lib.attrNames
          (lib.map (filename: {
            name = lib.removeSuffix ".nix" filename;
            value = pkgs.callPackage (lib.path.append ./pkgs filename) {
              inherit custom;
              inherit (custom.lib) imageTools;
            };
          }))
          lib.listToAttrs
        ];

        devShells.default = pkgs.mkShell {
          inherit (self.checks.${system}.preCommitHooks) shellHook;
          buildInputs = self.checks.${system}.preCommitHooks.enabledPackages;
        };

        checks = {
          preCommitHooks = inputs.pre-commit-hooks.lib.${system}.run {
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

        formatter =
          let
            inherit (self.checks.${system}.preCommitHooks.config) package configFile;
          in
          pkgs.writeShellScriptBin "pre-commit-run" ''
            ${package}/bin/pre-commit run --all-files --config ${configFile}
          '';
      }
    )
    // {
      overlays.assets = final: prev: {
        custom = lib.attrsets.recursiveUpdate (lib.attrsets.optionalAttrs (prev ? custom) prev.custom) {
          assets = self.packages.${prev.system};
        };
      };

      lib = import ./lib { inherit lib; };
    };
}
