{ config, pkgs, ... }:

{

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.dave.extraGroups = [ "libvirtd" "kvm" "qemu-libvirtd"];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    kvmtool
    libvirt
    OVMFFull
    qemu
    spice
    spice-gtk
    spice-protocol
    spice-vdagent
    swtpm
    virt-manager
    virt-viewer
    win-spice
    win-virtio
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        package = pkgs.qemu_kvm;
        runAsRoot = false;
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

  environment.sessionVariables.LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];

}
