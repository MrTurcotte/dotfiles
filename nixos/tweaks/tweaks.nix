{ lib, config, pkgs, ... }:

{
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.dirty_bytes" = 536870912;
    "vm.dirty_background_bytes" = 268435456;
  };

  nix.settings.max-jobs = 3; 

  # powerManagement.cpuFreqGovernor = "performance";

  # boot.tmp.useTmpfs = true;

  services.logind = {
    # extraConfig = "HandlePowerKey=suspend";
    lidSwitch = "ignore";
  }; 

}
