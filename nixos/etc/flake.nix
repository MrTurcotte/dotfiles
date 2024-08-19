{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # NOTE: change "unstable" to "24.05" if you are using NixOS 24.05

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases

    home-manager = {
      url = "https://www.github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
      inputs.nixpkgs.follows =
        "nixpkgs"; # Use system packages list where available
    };
    
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  };

  outputs = { self, nixpkgs, nixos-cosmic, nix-flatpak, home-manager, hyprland, hyprland-plugins} @ inputs: {
      nixosConfigurations = {
        krypton = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
	    home-manager.nixosModules.default
            nixos-cosmic.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak
            ./configuration.nix
          ];
        };
      };
    };
  
}
