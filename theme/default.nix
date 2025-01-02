{
  pkgs,
  lib,
  ...
}: let
  wall = ./wall.png;
  mkService = lib.recursiveUpdate {
    Unit.PartOf = ["graphical-session.target"];
    Unit.After = ["graphical-session.target"];
    Install.WantedBy = ["graphical-session.target"];
  };
in {
  home-manager.users.grajap.systemd.user.services = {
    swaybg = mkService {
      Unit.Description = "Wallpaper chooser";
      Service = {
        ExecStart = "${lib.getExe pkgs.swaybg} -i ${wall}";
        Restart = "always";
      };
    };
  };
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets.spicetify.enable = false;
    cursor = {
      package = pkgs.catppuccin-cursors;
      name = "catppuccin-mocha";
      size = 24;
    };
    image = wall;
    polarity = "dark"; # "light" or "either
    opacity = {
      applications = 1.0;
      terminal = 0.8;
      desktop = 1.0;
      popups = 0.8;
    };
  };
}
