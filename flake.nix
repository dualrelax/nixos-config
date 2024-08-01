{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows ="nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      ni = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [./nixos/configuration.nix];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      # FIXME replace with your username@hostname
      "h@ni" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [
          hyprland.homeManagerModules.default
          {
            wayland.windowManager.hyprland = {
              enable = true;
              extraConfig = ''
	         $terminal = xfce4-terminal
		 $fileManager = thunar
		 exec-once = waybar & hyprpaper
		 exec-once = fcitx5
		 exec-once = gammastep -O 3500
		 
		 env = XMODIFIERS DEFAULT,@im,fcitx
		 env = GTK_IM_MODULE DEFAULT,fcitx
		 env = QT_IM_MODULE DEFAULT,fcitx 
		 
		 bind = $mainMod, h, movefocus, l
		 bind = $mainMod, l, movefocus, r
		 bind = $mainMod, k, movefocus, u
		 bind = $mainMod, j, movefocus, d

                plugin {
                }
              '' + ''
                # your othor config
              '';
            };
          }
          # ...
        ];
      };
    };
  };
}

