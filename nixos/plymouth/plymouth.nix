{ pkgs, config, lib, ... }:

# let
  # Fetch the repository
  # nixos-boot-src = pkgs.fetchFromGitHub {
    # owner = "Melkor333";
    # repo = "nixos-boot";
    # rev = "main";
    # sha256 = "sha256-Dj8LhVTOrHEnqgONbCEKIEyglO7zQej+KS08faO9NJk=";
  # };
# in

{
	  
  boot.plymouth.enable = true;
  boot.plymouth.theme="breeze";
#  boot.plymouth.themePackages = [
#    pkgs.catppuccin-plymouth
#  ];
  boot.initrd.systemd.enable = true;
  boot.kernelParams = ["quiet" "i915" "video=eDP-1:1920x1280@60"];

  environment.systemPackages = with pkgs; [
    plymouth
#    pkgs.catppuccin-plymouth
  ];

  # imports = [ "${nixos-boot-src}/modules.nix" ];

  # nixos-boot = {
    # enable  = true;

    # Different colors
    # bgColor.red   = 100; # 0 - 255
    # bgColor.green = 100; # 0 - 255
    # bgColor.blue  = 100; # 0 - 255

    # If you want to make sure the theme is seen when your computer starts too fast
    # duration = 3; # in seconds
  # };

}

