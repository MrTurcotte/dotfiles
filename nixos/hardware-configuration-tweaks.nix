{ config, pkgs, lib, ... }:

{
  
  boot = {
    kernelModules = [
      "fbcon=nodefer"               # prevent the kernel from blanking plymouth out of the fb
      "i915"
      "i915.modeset=1"
      "kvm-intel"
      # "logo.nologo"                 # disable boot logo if any
      # "quiet"                       # tell the kernel to not be verbose
      # "rd.systemd.show_status=auto" # disable systemd status messages
      "rd.udev.log_level=3"         # lower the udev log level to show only errors or worse
      # "video=eDP-1:1920x1200@60"
    ];
  };


}