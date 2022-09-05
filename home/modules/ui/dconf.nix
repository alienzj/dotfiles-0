{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    #"org/gnome/desktop/interface" = {
    #  "icon-theme" = "Adwaita";
    #  "theme" = "Adwaita";
    #};

    "org/gnome/desktop/background" = {
      picture-uri = "file://${../../data}/wallpapers/0127_girl-rain-koba-sewer.jpg";
      picture-options = "zoom";
    };

    "org/gnome/desktop/lockdown" = {
      disable-lock-screen = false;
    };

    "org/gnome/shell" = {
      always-show-log-out = true;
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "dash-to-panel@jderose9.github.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com"
      ];

      "org/gnome/shell/extensions/dash-to-panel" = {
        animate-appicon-hover-animation-extent="{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
        appicon-margin=4;
        appicon-padding=4;
        available-monitors=[0];
        dot-position="BOTTOM";
        hotkeys-overlay-combo="TEMPORARILY";
        intellihide=false;
        leftbox-padding=-1;
        panel-anchors="{"0":"MIDDLE"}";
        panel-element-positions='{"0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":true,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}';
        panel-element-positions-monitors-sync=true;
        panel-lengths="{"0":100}";
        panel-positions="{"0":"BOTTOM"}";
        panel-sizes="{"0":30}";
        status-icon-padding=-1;
        tray-padding=-1;
        window-preview-title-position="TOP";
      };
    };
  };
}

