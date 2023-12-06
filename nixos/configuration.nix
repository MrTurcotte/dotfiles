# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{


  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./boot
      ./vm
      ./packages
      ./distrobox
      ./garbage
#      ./unstable
      ./xserver
#      ./power
#      ./home
      ./networking
      ./networking/networkmanager
      ./earlyoom
      ./appimage
      ./fonts
      ./services
      ./zramswap
      ./intel
      ./sound
#      <nix-ld/modules/nix-ld.nix>
    ];

#  programs.nix-ld.enable = true;
#  programs.nix-ld.dev.enable = true;

  # Use the systemd-boot EFI boot loader.
#  boot.loader.systemd-boot.enable = true;
#  boot.loader.efi.canTouchEfiVariables = true;
 
  # networking.hostName = "krypton"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  


  # Allow Nix-command
  nix.settings.experimental-features = [ "nix-command flakes" ];

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Filesystem Stuff
  services.envfs.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Disable lid switch
  services.logind = { lidSwitch = "suspend"; };
#  services.logind = { lidSwitch = "lock"; };

  #  Enable Flatpak
  services.flatpak.enable = true;

  # Enable dbus
  services.dbus.enable = true;
  
  # Don't allow mutation of users outside of the config.
  users.mutableUsers = false;

  # Set a root password, consider using initialHashedPassword instead.
  #
  # To generate a hash to put in initialHashedPassword
  # you can do this:
  # $ nix-shell --run 'mkpasswd -m SHA-512 -s' -p mkpasswd
  users.users.root.initialHashedPassword = "$6$9m181COWHkJSzfjq$OKbKMQHEqHyO42w.5cLyGf9zxkJPFjVyFOVGdWvcUcB0yRoQDFNpRwJlJZInYuRaT6dwB3VKwMN8gxx9UcdOG/";


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dave = {
    initialHashedPassword = "$6$kURAEGO4qxHXFzjX$/Yb1sws7T31a2lXnRrFPv3wPwSSLSCQjgwXfNGOy4AfqQG74oKxDnQhNiPiO1Nf02XFGgPN4F.p4r3he698K1/";
    isNormalUser = true;
    extraGroups = [
      "disk"
      "udev"
      "docker"
      "networkmanager"
      "wheel"
      "libvirtd"
      "adbusers"
      "samba"
      "smb"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  users.users.jen = {
      initialHashedPassword = "$6$sJi8b/nrMhCj9TQU$epPXyNm9/6NprUEsSt38l.iqS0PodvKvmRjwHxzPGcX9dhvbpLownXIyb2MtDtvRYHLQsSi/a.Sw3mbfRCDrh.";
      isNormalUser = true;
      description = "Jen Soullier";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      packages = with pkgs; [
      ];
    };

  # Samba
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/home/dave/share" = {
    device = "//192.168.2.44/sambashare/";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts =
        "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in [
      "${automount_opts},credentials=/home/dave/smb-secrets,uid=1000,gid=100"
    ];
    # options = [ "credentials=/etc/nixos/smb-secrets,uid=1000,gid=100" ];
  };

  # Android 
  programs.adb.enable = true;



  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

