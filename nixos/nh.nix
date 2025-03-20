{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--nogc --nogcroots";
    };
  };
}
