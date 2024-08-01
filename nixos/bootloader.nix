{ config, inputs, pkgs, ...}: {
  boot.loader = {  
    #systemd-boot.enable = true;
    grub.enable = true;
    grub.efiSupport = true;
    grub.efiInstallAsRemovable = true;
    efi.efiSysMountPoint = "/boot";
    grub.device = "nodev";
  };
}
