{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
        lutris
    github-desktop
    #google-chrome
    udev
    vlc
    caprine-bin
    davinci-resolve
    nemo
    libreoffice-fresh
    webcord
    calcurse
    spotify-player
    signal-desktop
  ];
}
