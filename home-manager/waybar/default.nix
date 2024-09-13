{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.programs.waybar;
  css_vars = {
    "@font" = config.local.theming.font.name;
    "@radius" = "2px";
    "@padding" = "0px 3px";
    "@spacing" = "3px";
    "@margin" = "3px 3px";
  };
  onChange = ''
    ${pkgs.procps}/bin/pgrep waybar && ${
      inputs.hyprland.packages.${pkgs.hostPlatform.system}.default
    }/bin/hyprctl dispatch exec "pkill waybar;waybar &" || true
  '';
in
{
  home.packages = mkIf cfg.enable [ pkgs.playerctl ];
  xdg.configFile = mkIf cfg.enable {
    "waybar/config" = {
      inherit onChange;
      source = "${./config.json}";
    };
    "waybar/colors.css" = {
      inherit onChange;
      source = "${config.programs.matugen.theme.files}/.config/waybar/colors.css";
    };
    "waybar/style.css" = {
      inherit onChange;
      text = builtins.replaceStrings (builtins.attrNames css_vars) (builtins.attrValues css_vars) ''
        ${builtins.readFile ./style.css}
      '';
    };
  };
  programs.waybar.systemd = {
    enable = true;
    target = "hyprland-session.target";
  };
}
