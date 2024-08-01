{ config, inputs, pkgs, ...}: {
  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    waybar.enable = true;
    xfconf.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      histFile = "$HOME/.zsh_history"; 
      histSize = 10000;
    }; 
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod.enabled = "fcitx5";
    inputMethod.fcitx5.addons = [
      pkgs.fcitx5-configtool
      pkgs.fcitx5-chinese-addons
    ];
  };
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.flatpak.enable = true;
  services.v2raya.enable = true;
  services.cron.enable = true;

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      #dockerCompat = true;
      defaultNetwork.settings.dns_enable = true;
    };
  };

}
