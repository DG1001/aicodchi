{
  description = "VSCode + Aider development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    codchi.url = "github:aformatik/codchi";
  };

  outputs = { self, nixpkgs, codchi }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosModules.default = { config, pkgs, ... }: {
        imports = [
          ./codchi.nix
        ];
      };

      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
    };
}