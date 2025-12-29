{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./conf.nix
          ./users/bry/bry.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.users.root = import ./users/root/home.nix;
            home-manager.users.bry = import ./users/bry/home.nix;
          }
          # Add unstable neovim
          ({ pkgs, ... }: {
            environment.systemPackages = [ pkgs-unstable.neovim ];
          })
        ];
      };
    };
}
