{ config, lib, pkgs, ... }:

{
  imports = [ ./fonts.nix ];

  programs = {
    gpg.enable = true;

    ssh = {
      enable = true;
      extraConfig = ''
        AddKeysToAgent yes
      '';
    };

    starship = import ./starship.nix;

    zsh = import ./zsh { inherit config lib pkgs; };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    udiskie = {
      enable = true;
      tray = "never";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      desktop = "$HOME/";
      documents = "$HOME/documents";
      download = "$HOME/downloads";
      pictures = "$HOME/pictures";
    };
  };
}
