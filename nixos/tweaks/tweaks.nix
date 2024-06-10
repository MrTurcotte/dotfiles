{ lib, config, pkgs, ... }:

{
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.dirty_bytes" = 536870912;
    "vm.dirty_background_bytes" = 268435456;
  };

  nix.settings.max-jobs = 15; 

  powerManagement.cpuFreqGovernor = "performance";

  boot.tmp.useTmpfs = true;

}
