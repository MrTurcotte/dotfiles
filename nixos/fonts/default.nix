{ config, pkgs, ... }:

{
  # Fonts
  fonts.fonts = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    proggyfonts
    #    nerdfonts
    corefonts
    font-awesome
  ];
}
