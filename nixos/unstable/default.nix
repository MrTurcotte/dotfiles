{ config, pkgs, ... }:
let
  baseconfig = { allowUnfree = true; };
#  unstable = import <nixos-unstable> { config = baseconfig; };
  unstable-tarball = builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  unstable = import ( unstable-tarball ) { config = baseconfig; };
in { 
  environment.systemPackages = with pkgs; [ 
    unstable.ventoy-full 
  ]; 
}
