{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    github-desktop
    teams-for-linux
    brave
    #google-chrome
    udev
    vlc
    caprine-bin
    davinci-resolve
    nemo
    libreoffice-fresh
    glib
    calcurse
    spotify-player
    signal-desktop
  ];
}
