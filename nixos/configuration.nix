# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration-tweaks.nix
      ./users/dave.nix
      ./packages/packages.nix
      # ./packages/hyprland.nix
      ./fonts/fonts.nix
      ./intel/intel.nix
      ./distrobox/distrobox.nix
      ./appimage/appimage.nix
      ./vm/vm.nix
      ./tweaks/tweaks.nix
      ./systemd/systemd.nix
      # ./containers/nextcloud.nix
      ./containers/stirling.nix
      # ./containers/debian.nix
      ./environment/environment.nix
    ];

  boot.supportedFilesystems = [ "ntfs" ];
  boot.tmp.useTmpfs = true;

  nix.settings.experimental-features = [ "nix-command flakes" ];

  services.envfs.enable = true;

  # ZRAM
  zramSwap.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # PAM Working With Swaylock
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  # Plymouth
#  boot.plymouth.enable = true;
#  boot.plymouth.theme = "bgrt";
#  boot.initrd.verbose = false;
#  boot.consoleLogLevel = 0;
#  boot.kernelParams = [ "quiet" "udev.log_level=0" ]; 

  networking.hostName = "krypton"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot


  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.displayManager.sddm.theme = "breeze";
  services.displayManager.sddm.settings = {
    General = {
      InputMethod = "";
    };
    Theme = {
      FacesDir = "/home/Faces/";
      ThemeDir = "/home/sddm/";
    };
  };

  # Configure keymap in X11
  # services.xserver = {
  #   xkb.layout = "us";
  #   xkb.variant = "";
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
