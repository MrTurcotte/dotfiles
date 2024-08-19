{ config, ... }: {

  ###  TLP
  services.power-profiles-daemon.enable = false;
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      #   CPU_MIN_PERF_ON_AC = 0;
      #   CPU_MAX_PERF_ON_AC = 100;
      #   CPU_MIN_PERF_ON_BAT = 0;
      #   CPU_MAX_PERF_ON_BAT = 20;

      #  #Optional helps save long term battery health
      #  START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      #  STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
  };


  ### AUTO-CPUFREQ
  # powerManagement = {
  #   enable = true;
  #   powertop.enable = true;
  #   cpuFreqGovernor = "powersave";
  # };
  # services = {
  #   thermald.enable = true;
  #   power-profiles-daemon.enable = false;
  #   auto-cpufreq = {
  #     enable = true;
  #     settings = {
  #       battery = {
  #         governor = "powersave";
  #         turbo = "never";
  #       };
  #       charger = {
  #         governor = "powersave";
  #         turbo = "auto";
  #       };
  #     };
  #   };
  #   system76-scheduler = {
  #     enable = true;
  #     useStockConfig = true;
  #   };
  #   udev.extraRules = ''
  #     # Remove NVIDIA USB xHCI Host Controller devices, if present
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
  #     # Remove NVIDIA USB Type-C UCSI devices, if present
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
  #     # Remove NVIDIA Audio devices, if present
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
  #     # Remove NVIDIA VGA/3D controller devices
  #     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  #   '';
  # };
  boot = {
    extraModprobeConfig = ''
      blacklist nouveau
      options nouveau modeset=0
    '';
    blacklistedKernelModules =
      [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
  };
}