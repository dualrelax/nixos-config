# 1.nixos-config
nixos configuration

# 2.How to use 
(1)Change hostname to ni
```
sudo echo "ni" > /etc/hostname
```
(2)Use your hardware-configuration.nix replace nixos/hardware-configuration.nix

(3)Build
```
cd /etc/nixos
sudo nixos-rebuild switch --flake .#ni
```
# 3.minimal
minimal is from https://github.com/Misterio77/nix-starter-configs
