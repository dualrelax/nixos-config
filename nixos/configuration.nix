{ config, inputs, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
    ./desktop.nix
    ./settings.nix
    ./packages.nix
  ];
}

