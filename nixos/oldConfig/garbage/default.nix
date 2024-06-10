{ config, pkgs, ... }:

{

  # Disable warnings, auto store optimization 
  # and enable experimental features
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "daily";

  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
    };

    # Enable automatic garbage collection, 
    # frequency of garbage collection and 
    # deleting older generations older-than 3d
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
  };
}
