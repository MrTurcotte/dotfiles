{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.alacritty;
  yamlFormat = pkgs.formats.yaml { };
in {
  home-manager.users.dave = {
    options = {
      programs.alacritty = {
        enable = mkEnableOption "Alacritty";

        package = mkOption {
          type = types.package;
          default = pkgs.alacritty;
          defaultText = literalExpression "pkgs.alacritty";
          description = "The Alacritty package to install.";
        };

        settings = mkOption {
          type = yamlFormat.type;
          default = { };
          example = literalExpression ''
            {
              window = {
                opacity = 0.6;
                padding = {
                  x = 6;
                  y = 6;
                };
              };
              font.size = 16;
              cursor = {
                style = {
                  shape = Beam;
                  blinking = Always;
                };
                blink_interval = 500;
                unfocused_hollow = true;
                thickness = 0.15;
              };
              colors = {
                primary = {
                  background = "#000000";
                  foreground = "#d8dee9";
                  dim_foreground = "#a5abb6";
                };
                cursor = {
                  text = "#2e3440";
                  cursor = "#d8dee9";
                };
                vi_mode_cursor = {
                  text = "#2e3440";
                  cursor = "#d8dee9";
                };
                selection = {
                  text = CellForeground;
                  background = "#4c566a";
                };
                search = {
                  matches = {
                    foreground = CellBackground;
                    background = "#88c0d0";
                  };
                  footer_bar = {
                    background = "#434c5e";
                    foreground = "#d8dee9";
                  };
                };
                normal = {
                  black = "#3b4252";
                  red = "#bf616a";
                  green = "#a3be8c";
                  yellow = "#ebcb8b";
                  blue = "#81a1c1";
                  magenta = "#b48ead";
                  cyan = "#88c0d0";
                  white = "#e5e9f0";
                };
                bright = {
                  black = "#4c566a";
                  red = "#bf616a";
                  green = "#a3be8c";
                  yellow = "#ebcb8b";
                  blue = "#81a1c1";
                  magenta = "#b48ead";
                  cyan = "#8fbcbb";
                  white = "#eceff4";
                };
                dim = {
                  black = "#373e4d";
                  red = "#94545d";
                  green = "#809575";
                  yellow = "#b29e75";
                  blue = "#68809a";
                  magenta = "#8c738c";
                  cyan = "#6d96a5";
                  white = "#aeb3bb";
                };
              };
            }
          '';
          description = ''
            Configuration written to
            {file}`$XDG_CONFIG_HOME/alacritty/alacritty.yml`. See
            <https://github.com/alacritty/alacritty/blob/master/alacritty.yml>
            for the default configuration.
          '';
        };
      };
    };

    config = mkMerge [
      (mkIf cfg.enable {
        home.packages = [ cfg.package ];
        xdg.configFile."alacritty/alacritty.yml" = mkIf (cfg.settings != { }) {
          # TODO: Replace by the generate function but need to figure out how to
          # handle the escaping first.
          #
          # source = yamlFormat.generate "alacritty.yml" cfg.settings;

          text =
            replaceStrings [ "\\\\" ] [ "\\" ] (builtins.toJSON cfg.settings);
        };
      })
    ];
  };
}

