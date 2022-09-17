{ pkgs, ... }:
let
  custom-script-eww-battery = pkgs.writeScriptBin "custom-script-eww-battery" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/battery}
  '';
  custom-script-eww-check-network = pkgs.writeScriptBin "custom-script-eww-check-network" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/check-network}
  '';
  custom-script-eww-mails = pkgs.writeScriptBin "custom-script-eww-mails" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/mails}
  '';
  custom-script-eww-music_info = pkgs.writeScriptBin "custom-script-eww-music_info" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/music_info}
  '';
  custom-script-eww-quotes = pkgs.writeScriptBin "custom-script-eww-quotes" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/quotes}
  '';
  custom-script-eww-sys_info = pkgs.writeScriptBin "custom-script-eww-sys_info" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/sys_info}
  '';
  custom-script-eww-system = pkgs.writeScriptBin "custom-script-eww-system" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/system}
  '';
  custom-script-eww-volume = pkgs.writeScriptBin "custom-script-eww-volume" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/volume}
  '';
  custom-script-eww-weather_info = pkgs.writeScriptBin "custom-script-eww-weather_info" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/weather_info}
  '';
  custom-script-eww-widget_apps = pkgs.writeScriptBin "custom-script-eww-widget_apps" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/widget_apps}
  '';
  custom-script-eww-widget_search = pkgs.writeScriptBin "custom-script-eww-widget_search" ''
    #!/${pkgs.stdenv.shell}
    ${builtins.readFile ./scripts/widget_search}
  '';
in
{
  home.packages = with pkgs; [
    custom-script-eww-battery
    custom-script-eww-check-network
    custom-script-eww-mails
    custom-script-eww-music_info
    custom-script-eww-quotes
    custom-script-eww-sys_info
    custom-script-eww-system
    custom-script-eww-volume
    custom-script-eww-weather_info
    custom-script-eww-widget_apps
    custom-script-eww-widget_search
    eww
  ];

  home.file.".config/eww/eww.scss".source = ./eww.scss;
  home.file.".config/eww/eww.yuck".source = ./eww.yuck;
}
