{
  pkgs,
  username,
  inputs,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.hmModules.nur
    ./dunst.nix
    ./firefox.nix
    ./fish.nix
    ./foot.nix
    # ./hypr.nix
    ./lf.nix
    ./neofetch.nix
    ./nvim
    ./scripts.nix
    ./starship.nix
    ./sway.nix
    ./theme.nix
    ./tmux.nix
    ./waybar.nix
    ./wezterm.nix
    ./wofi.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  programs = {
    obs-studio.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}