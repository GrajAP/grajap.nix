{...}: {
  hardware.enableAllFirmware = true;
  services = {
    pulseaudio.support32Bit = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      wireplumber.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
