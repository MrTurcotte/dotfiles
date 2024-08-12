{ pkgs, ... }:

{
  services.flatpak.packages = [
    "com.snes9x.Snes9x"
    "com.heroicgameslauncher.hgl"
    "io.gitlab.gregorni.Letterpress"
    "us.zoom.Zoom"
    "com.github.tchx84.Flatseal"
  ];

}
