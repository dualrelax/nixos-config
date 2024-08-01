{ config, inputs, pkgs, ...}: {
  nix.settings.substituters = [ 
    "https://mirror.sjtu.edu.cn/nix-channels/store"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #services.openssh.enable = true;
  system.stateVersion = "24.05";

  networking.networkmanager.enable = true;
  networking.hostName = "ni";
  
  users = {
    users.h = {
      shell = pkgs.zsh;
      extraGroups = ["h" "wheel"];
      isNormalUser = true;
    };
    groups.h = {};
  };

}

