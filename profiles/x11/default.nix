{ config, lib, pkgs, ... }:

{
  options.profiles.x11 = {
    enable = lib.mkEnableOption "X11 Server";
  };

  config = lib.mkIf config.profiles.x11.enable {
    fonts.fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ "Iosevka" ];
      })
    ];

    services.xserver = {
      enable = true;
      layout = "us";
      libinput = {
        enable = true;
        naturalScrolling = true;
        tapping = false;
        accelProfile = "flat";
      };

      config = ''
        Section "InputClass"
          Identifier "mouse accel"
          Driver "libinput"
          MatchIsPointer "on"
          Option "AccelProfile" "flat"
          Option "AccelSpeed" "0"
        EndSection
      '';

      displayManager = {
        lightdm.greeters.mini = {
          enable = true;
          user = "kevin";
          extraConfig = lib.readFile ./lightdm-mini-greeter.conf;
        };
      };

      windowManager.i3.enable = true;
    };
  };
}
