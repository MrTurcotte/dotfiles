{ config, pkgs, ... }:

{
  imports = [
    /home/dave/nixos/configuration.nix
    ./hardware-configuration.nix
  ];
}
