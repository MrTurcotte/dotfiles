{ config, pkgs, ... }:

{
  # Enable automatic garbage collection
  nix.gc.automatic = true;

  # Schedule the garbage collection to run daily at 8 PM
  nix.gc.dates = "daily 20:00";

  # Specify the age limit for garbage collection
  nix.gc.options = "--delete-older-than 3d";

  # Automatically Optimize the Store
  nix.settings.auto-optimise-store = true;
}
