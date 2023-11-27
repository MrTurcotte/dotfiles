{ config, pkgs, lib, ... }:

{

  # Networking
#  programs.nm-applet.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    enableIPv6 = true;
    hostName = "krypton"; # Define your hostname.
    networkmanager.connectionConfig = {
      "ethernet.mtu" = 1462;
      "wifi.mtu" = 1462;
    };
    networkmanager.enable = true;
#    wireless.enable = true;
    wireless.networks = {
#      "Stormwind Keep 5G" = {
#        psk = "rockyearth523";
#        pskRaw = "87c396a8f2e7c41e4d85bb3426c8625715d63333dd89d572c4bdbb823fdfcbdc";
#      };

#      "Chaotic Space 5G" = {
#        pskRaw = "d2de956ee9cba2db24cb1d1c0e510acd4f5d38fa7a3202329f5c22fa0d85f76b";
#      };

#      "Quality Inn Guest" = {
#        psk = "welcome1";
#      };

    };
    firewall = {
      allowedUDPPorts = [ 5353 ]; # For device discovery
      allowedUDPPortRanges = [{
        from = 32768;
        to = 61000;
      }]; # For Streaming
      allowedTCPPorts = [ 8010 ]; # For gnomecast server
    };
  };
  systemd.services.modify-autoconnect-priority = {
    description =
      "Modify autoconnect priority of 'Stormwind Keep 5G' connection";
    script = ''
      nmcli connection modify 'Stormwind Keep 5G' connection.autoconnect-priority 1
    '';
  };
}
