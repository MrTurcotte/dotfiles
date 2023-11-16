{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];
  home-manager.users.dave = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
#    programs.bash = {
#      enable = true;
#      bashrcExtra = ''
#        . ./bashrc
#      '';
#    };
#    home.packages = with pkgs; [ home-manager ];
    home.file.".bashrc".source = ./bashrc;
#    programs.home-manager.enable = true;

  };
}
