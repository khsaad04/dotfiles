{ lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = lib.mkBefore [
      "fbcon=nodefer"
      "vt.global_cursor_default=0"
      "quiet"
      "systemd.show_status=auto"
      "udev.log_level=3"
      "plymouth.use-simpledrm"
      "splash"
    ];
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
    loader = {
      systemd-boot = {
        configurationLimit = 10;
        consoleMode = "max";
        editor = false;
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
