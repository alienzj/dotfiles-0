{ pkgs, colorscheme, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {
      plugins = [ pkgs.rofi-emoji pkgs.rofi-calc pkgs.rofi-file-browser ];
    };
    font = "hack 12";
  };
  home.file.".config/rofi/colors.rasi".text = ''
    * {
      accent: ${colorscheme.accent-primary};
      accent-secondary: ${colorscheme.accent-secondary};
      background: ${colorscheme.bg-primary};
      foreground: ${colorscheme.fg-primary};
    }
  '';
  home.file.".config/rofi/grid.rasi".source = ./grid.rasi;
  home.file.".config/rofi/launcher.rasi".source = ./launcher.rasi;
}

# fix icon size
# https://github.com/davatorium/rofi/issues/1185
