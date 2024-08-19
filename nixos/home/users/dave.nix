{ inputs, config, pkgs, home-manager, ... }:

{
  users.users.dave = {
    isNormalUser = true;
    description = "David Turcotte";
    group = "users";
    extraGroups = [ 
      "adbusers"
      "audio"
      "cdrom"
      "docker"
      "gamemode" 
      "mysql" 
      "networkmanager" 
      "podman"
      "video"
      "wheel" 
    ];
    packages = with pkgs; [
    ];
    shell = pkgs.bash;
    home = "/home/dave";
  };

  programs.bash = {
    enableLsColors = true;
    enableCompletion = true;
  };

  home-manager.users.dave = { pkgs, ... }: {
    home.stateVersion = "24.05";
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = (builtins.readFile ./hyprland.conf);
      plugins = [
        pkgs.hyprlandPlugins.hyprexpo      
        pkgs.hyprlandPlugins.hyprtrails
      ];
    };
  };

}
