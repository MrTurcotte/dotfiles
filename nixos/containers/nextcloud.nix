{ config, lib, pkgs, ... }:

{
  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "ens3";
    # Lazy IPv6 connectivity for the container
    enableIPv6 = true;
  };

  containers.nextcloud = {
    autoStart = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    hostAddress6 = "fc00::1";
    localAddress6 = "fc00::2";
    config = { config, pkgs, lib, ... }: {

      services.nextcloud = {
        enable = true;
        package = pkgs.nextcloud29;
        hostName = "localhost";
#        config.adminpassFile = "${pkgs.writeText "admin"
#          "test123"}"; # DON'T DO THIS IN PRODUCTION - the password file will be world-readable in the Nix Store!
        # https = true;
        autoUpdateApps.enable = true;
        autoUpdateApps.startAt = "05:00:00";

        # Further forces Nextcloud to use HTTPS
        # settings.overwriteProtocol = "https";
        settings.trusted_domains = [
          "192.168.*.*"
        ];

 #       config = {
        #   # Nextcloud PostegreSQL database configuration, recommended over using SQLite
        #   dbtype = "pgsql";
        #   dbuser = "nextcloud";
        #   dbhost =
        #     "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
        #   dbname = "nextcloud";
        #   # dbpassFile = "/var/nextcloud-db-pass";

        #   # adminpassFile = "/var/nextcloud-admin-pass";
 #         adminuser = "admin";
 #       };

      };

      system.stateVersion = "24.05";

      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 80 443 ];
        };
        # Use systemd-resolved inside the container
        # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
        useHostResolvConf = lib.mkForce false;
      };

      services.resolved.enable = true;

    };
  };
}
