{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    github-desktop
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
