{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # vesktop # If you prefer this

    (discord.override {
      withOpenASAR = true; # can do this here too
      withVencord = true;
    })
  ];
  imports = [
    ./wayland
    ./core
  ];
}
