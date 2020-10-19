{ config, lib, pkgs, ... }:

{
  networking.hostName = "tarvos";
  system.stateVersion = "20.03";

  imports = [ ./hardware-configuration.nix ];

  profiles = {
    x11.enable = true;
  };

  systemd.services.muteLight = {
    description = "Disable mute light";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/echo 0";
      StandardOutput = "file:/sys/class/leds/platform::mute/brightness";
    };
  };
}
