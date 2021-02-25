{ pkgs, ... }:

{
  users.kevin = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" "wireshark" ];
    initialPassword = "pass";
  };
}
