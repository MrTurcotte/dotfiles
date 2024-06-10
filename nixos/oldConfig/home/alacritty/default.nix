{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager.users.dave = {
    home.file.".config/alacritty/alacritty.yml".source = ./config;
  };
}
