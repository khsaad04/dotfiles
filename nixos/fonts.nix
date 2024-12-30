{ pkgs, ... }:
{
  fonts = {
    packages = [
      pkgs.noto-fonts
      pkgs.iosevka
      pkgs.nerd-fonts.symbols-only
    ];
    fontconfig = {
      defaultFonts =
        let
          common = [
            "Iosevka"
            "Symbols Nerd Font"
            "Noto Sans Bengali"
            "Noto Serif Bengali"
          ];
        in
        {
          monospace = common;
          serif = common;
          sansSerif = common;
          emoji = [ "Noto Color Emoji" ];
        };
    };
  };
}
