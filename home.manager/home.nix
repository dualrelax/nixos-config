{ config,pkgs, ...}: {
  home.username = "h";
  home.homeDirectory = "/home/h";
  home.packages = with pkgs;[ 
  ];
  
  home.stateVersion = "23.11";
  programs.xwayland.enable = true;
  programs.home-manager.enable = true;
  wayland.windowManager.hyprland.enable = true; 
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
  }
}
