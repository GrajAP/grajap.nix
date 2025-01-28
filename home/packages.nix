{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    github-desktop
       teams
    brave
    #google-chrome
    udev
    vlc
    caprine-bin
    davinci-resolve
    nemo
    libreoffice-fresh
    calcurse
    spotify-player
    signal-desktop
  ];
}
