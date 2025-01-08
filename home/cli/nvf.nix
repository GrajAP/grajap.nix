{
  pkgs,
  lib,
  ...
}: {
  vim = {
    theme = {
      enable = true;
      name = "catppuccin-mocha";
    };
    telescope.enable = true;
  };
}
