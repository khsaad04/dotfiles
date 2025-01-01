{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    sway = {
      enable = true;
      extraPackages = lib.mkForce [ ];
    };
    command-not-found.enable = false;
    nix-ld.enable = true;
    nano.enable = false;
    fish.enable = true;
    adb.enable = true;
    direnv = {
      enable = true;
      silent = true;
    };
  };

  services.fstrim.enable = true;
  services.udisks2.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3-dark";
      };
    }
  ];

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.khsaad = {
      isNormalUser = true;
      initialPassword = "khsaad";
      description = "KH Saad";
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
      ];
      packages = [
        # sway
        pkgs.wl-clip-persist
        pkgs.findutils
        pkgs.sway-contrib.grimshot
        pkgs.xorg.xrdb

        # theming
        pkgs.adw-gtk3
        pkgs.adwaita-icon-theme
        pkgs.qt6Packages.qtstyleplugin-kvantum
        pkgs.qt6Packages.qt6ct
        pkgs.libsForQt5.qtstyleplugin-kvantum
        pkgs.libsForQt5.qt5ct

        # neovim
        pkgs.neovim
        pkgs.luajitPackages.jsregexp
        pkgs.cmake
        pkgs.unzip
        pkgs.tree-sitter
        pkgs.ripgrep
        pkgs.lua-language-server
        pkgs.nil
        pkgs.stylua
        pkgs.prettierd

        # misc
        pkgs.xdg-utils
        pkgs.wget
        pkgs.file
        pkgs.fd
        pkgs.ripgrep
        pkgs.btop
        pkgs.wl-clipboard
        pkgs.qbittorrent
        pkgs.pavucontrol
        pkgs.cargo
        pkgs.gcc
        pkgs.python3
        inputs.self.packages.${pkgs.system}.formatter
        inputs.self.packages.${pkgs.system}.changevolume
        inputs.self.packages.${pkgs.system}.powermenu
        inputs.dotman.packages.${pkgs.system}.default
        pkgs.firefox-bin
        pkgs.foot
        pkgs.starship
        pkgs.tmux
        pkgs.tmux-sessionizer
        pkgs.tofi
        pkgs.waybar
        pkgs.playerctl
        pkgs.yazi
        pkgs.zathura
        pkgs.obs-studio
        pkgs.mpv
        pkgs.feh
        pkgs.dunst
        pkgs.libnotify
        pkgs.udiskie
        pkgs.networkmanagerapplet
        pkgs.git
      ];
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = [ pkgs.fcitx5-openbangla-keyboard ];
    };
  };

  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
