{ config, pkgs, lib, ... }:

{

  boot = {
    consoleLogLevel = 3;
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
#      grub.enable = lib.mkForce true;
#      grub.device = "nodev";
#      grub.useOSProber = true;
#      grub.efiSupport = true;
      # ...
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    initrd.systemd.enable = true;
    plymouth.enable = true;
    plymouth.theme = "breeze";
    kernelParams = [ 
      "quiet"
      "mitigations=off" 
#      "i915.fastboot=1"
#      "i915.modeset=1"
#      "i915.enable_fbc=1"
#      "i915.enable_psr=1"
#      "i915.enable_dc=1"
    ];
    kernel.sysctl = {
      #      "vm.dirty_background_bytes" = 16777216;
      #      "vm.dirty_bytes" = 50331648;
      #      "vm.dirty_background_bytes" = 268435456;
      #      "vm.dirty_bytes" = 1073741824;
      "vm.dirty_background_bytes" = 583200768;      # 556 MB (128 MB + 450 MB)
      "vm.dirty_bytes" = 851968768;                 # 812 MB (384 MB + 450 MB)
      "vm.min_free_kbytes" = 65536;                 # Minimum free memory for safety (in KB)
      "vm.swappiness" = 0;
      "vm.vfs_cache_pressure" = 90;

      # Adjust dirty data management for NVMe drives
      "vm.dirty_background_ratio" = "5";            # Set the ratio of dirty memory at which background writeback starts (5%).
      "vm.dirty_expire_centisecs" = "3000";         # Set the time at which dirty data is old enough to be eligible for writeout (3000 centiseconds).
      "vm.dirty_ratio" = "10";                      # Set the ratio of dirty memory at which a process is forced to write out dirty data (10%).
      "vm.dirty_time" = "0";                        # Disable dirty time accounting.
      "vm.dirty_writeback_centisecs" = "300";       # Set the interval between two consecutive background writeback passes (300 centiseconds).


    };
  };

  # NTFS Support
  boot.supportedFilesystems = [ "ntfs" ];

  # tmpfs (a filesystem stored in RAM) settings for the NixOS boot process.
  # Clean tmpfs on system boot, useful for ensuring a clean state.
  boot.tmp.cleanOnBoot = true;

  # Enable tmpfs for the specified directories.
  boot.tmp.useTmpfs = true;

  # Allocate 50% of RAM for tmpfs. You can adjust this percentage to your needs.
  boot.tmp.tmpfsSize = "25%";


}
