{ config, pkgs, ... }:

{
  imports = [
    ./profiles
  ];

  profiles = {
    x11.enable = true;
  };
}
