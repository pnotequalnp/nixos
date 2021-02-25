{ lib, pkgs, ... }:

{
  enable = true;
  extraConfig = lib.readFile ./init.vim; # + ''
  #   if !exists('g:vscode')
  #     luafile ${./init.lua}
  #   endif
  # '';

  plugins = with pkgs.vimPlugins; [
    # completion-nvim
    # diagnostic-nvim
    fzf-vim
    indentLine
    # haskell-vim
    neodark-vim
    pear-tree
    rainbow
    targets-vim
    # nvim-lspconfig
    # nvim-treesitter
    vim-addon-nix
    vim-commentary
    vim-easy-align
    vim-easymotion
    vim-exchange
    vim-indent-object
    vim-repeat
    vim-sandwich
    vim-sneak
    # vimtex
  ];
}
