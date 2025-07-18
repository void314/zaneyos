{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-flatpak,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    host = "void314";
    profile = "nvidia";
    username = "void314";
  in {
    nixosConfigurations = {
      amd = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/amd
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      nvidia = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/nvidia
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      nvidia-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/nvidia-laptop
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      intel = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/intel
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/vm
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
  };
}
