{ config, inputs, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    asciiquarium
    arch-install-scripts
    baobab
    brightnessctl
    calibre
    cmake
    chromium
    distrobox
    dive
    drawio
    efibootmgr
    firefox
    gammastep
    git
    gnome.gnome-system-monitor
    goldendict-ng
    pot
    libreoffice
    libsForQt5.qt5ct
    mako
    neofetch
    neovim
    orchis-theme
    papirus-icon-theme
    qt6Packages.qt6ct
    timeshift
    tor-browser
    vim
    virtualbox
    wireshark
    wl-clipboard
    wofi
    xfce.thunar
    xfce.xfce4-settings
    xfce.xfce4-terminal
    xorg.xlsclients
    xorg.xwininfo
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
  ];
}
