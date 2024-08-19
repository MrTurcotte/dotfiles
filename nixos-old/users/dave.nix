{ config, pkgs, ... }:

{
  users.users.dave = {
    isNormalUser = true;
    description = "David Turcotte";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "podman" "docker" ];
    packages = with pkgs; [
      kate
    ];
  };

}
