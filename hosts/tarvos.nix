{ config, lib, pkgs, modulesPath, ... }:

{
  networking.hostName = "tarvos";
  system.stateVersion = "20.03";

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7dc8ea66-6cdc-4b7c-9f3f-5a40d746bc9d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6183-6250";
      fsType = "vfat";
    };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

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
