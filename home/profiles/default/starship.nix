{
  enable = true;
  settings = {
    add_newline = false;
    nix_shell = {
      symbol = " ";
      format = "via [$symbol$state]($style) ";
    };
  };
}
