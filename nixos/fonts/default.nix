{ config, pkgs, ... }:

{
  imports = [
    ./apple
  ];

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    proggyfonts
    #    nerdfonts
    corefonts
    font-awesome
  ];
}
