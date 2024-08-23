{ config, pkgs, ... }:
let
  baseconfig = { allowUnfree = true; };
  #  unstable = import <nixos-unstable> { config = baseconfig; };
  unstable-tarball = builtins.fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  unstable = import (unstable-tarball) { config = baseconfig; };
in {
#  environment.systemPackages = with pkgs; [
#    unstable.ventoy-full
#    unstable.alacritty
#    unstable.waybar
#    unstable.swww
#
#    unstable.volnoti
#  ];
#  nixpkgs.overlays = [
#    (self: super: {
#      waybar = super.waybar.overrideAttrs (oldAttrs: {
#        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
#      });
#    })
#  ];
#}
##########
#{ pkgs, ... }:
#
#{

  environment.systemPackages = with pkgs; [

unstable.hyprlandPlugins.hyprspace

];

}
