{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/Programming/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--nogc --nogcroots";
    };
  };
}
