{ config, pkgs, ... }:

{
  users.users.dave = {
    isNormalUser = true;
    description = "David Turcotte";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    packages = with pkgs; [
      kate
    ];
  };

}
