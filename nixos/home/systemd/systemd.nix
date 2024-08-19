{ config, lib, pkgs, ... }:

{

  systemd.services.copylockscreen = {
    enable = true;
    before = [ "display-manager.service" ];
    wantedBy = [ "default.target" ];
    script = "cp /home/dave/Wallpapers/$(ls /home/dave/Wallpapers | shuf -n 1) /tmp/lockscreen.jpg && chown dave:users /tmp/lockscreen.jpg";
    # serviceConfig = {
    #   ExecStart = "/home/dave/.local/bin/lockscreen.sh";
    # };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

}
