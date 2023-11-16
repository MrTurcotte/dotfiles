{ config, pkgs, ... }:

{
  # Power Control

  services.power-profiles-daemon.enable = false;
  services.upower.enable = true;

  boot.kernelParams = [ "intel_pstate=ondemand" ];
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 100;
      STOP_CHARGE_THRESH_BAT0 = 100;
      START_CHARGE_THRESH_BAT1 = 100;
      STOP_CHARGE_THRESH_BAT1 = 100;

      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      #      CPU_SCALING_MIN_FREQ_ON_AC = 800000
      #      CPU_SCALING_MAX_FREQ_ON_AC = 3500000
      #      CPU_SCALING_MIN_FREQ_ON_BAT = 800000
      #      CPU_SCALING_MAX_FREQ_ON_BAT = 2300000

      # Enable audio power saving for Intel HDA, AC97 devices (timeout in secs).
      # A value of 0 disables, >=1 enables power saving (recommended: 1).
      # Default: 0 (AC), 1 (BAT)
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;

      # Runtime Power Management for PCI(e) bus devices: on=disable, auto=enable.
      # Default: on (AC), auto (BAT)
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";

      # Battery feature drivers: 0=disable, 1=enable
      # Default: 1 (all)
      NATACPI_ENABLE = 1;
      TPACPI_ENABLE = 1;
      TPSMAPI_ENABLE = 1;
    };
  };

  services.thermald.enable = true;
#  powerManagement = {
#    enable = true;
#    powertop.enable = true;
#  };

}
