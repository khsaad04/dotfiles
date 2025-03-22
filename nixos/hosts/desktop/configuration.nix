{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    sway = {
      enable = true;
      extraPackages = [
        pkgs.sway-contrib.grimshot
        pkgs.findutils
        pkgs.xorg.xrdb
        pkgs.tofi
        pkgs.waybar
        pkgs.playerctl
        pkgs.networkmanagerapplet
        pkgs.dunst
        pkgs.libnotify
      ];
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
    systemPackages = [
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

      # language servers
      pkgs.lua-language-server
      pkgs.nil

      # devel tools
      pkgs.wget
      pkgs.file
      pkgs.fd
      pkgs.ripgrep
      pkgs.cargo
      pkgs.gcc
      pkgs.python3
      pkgs.git

      # console
      pkgs.foot
      pkgs.starship
      pkgs.tmux
      pkgs.tmux-sessionizer

      # misc
      pkgs.firefox
      pkgs.xdg-utils
      pkgs.btop
      pkgs.wl-clipboard
      pkgs.wl-clip-persist
      pkgs.qbittorrent
      pkgs.pavucontrol
      pkgs.yazi
      pkgs.zathura
      pkgs.obs-studio
      pkgs.mpv
      pkgs.feh
      pkgs.udiskie
      inputs.self.packages.${pkgs.system}.formatter
      inputs.self.packages.${pkgs.system}.changevolume
      inputs.self.packages.${pkgs.system}.powermenu
      inputs.dotman.packages.${pkgs.system}.default
    ];
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
        "wheel"
        "adbusers"
      ];
    };
  };

  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
