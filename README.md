* Steam
* Hyprland
    * waybar
* gtk4?
* Theme
    Nordic
    Adwaita color scheme instead?
    gsettings theme prefer-dark
* Wallpaper
* alias
    * git
* docker/podman
* Vscode/neovim
* Obsidian
* Vivaldi
* Protonpass
* 1Pass (dev-env?)
* PWA (dev-envs?)
    * Outlook
    * Teams
* SSH key 

### devshells
nix-direnv + flakes
* dotnet

### 
* home-manager as nix module
* auto-gc old generations

### impermanence
* disko
* impermanence as nixos module
    * persistence opts in hosts/
* tempfs for /, /home?
* steam game lib on separate disk, no impermanence
* persist:
    * /etc/machineId
    * home/x

* https://guekka.github.io/nixos-server-1/
* https://willbush.dev/blog/impermanent-nixos
* https://elis.nu/blog/2020/05/nixos-tmpfs-as-root/

## Install
User is hard-coded to "jr" in flake for all hosts.

1. Run installer iso
2. Exit installer into cmd
3. `sudo su`
6. `git clone https://github.com/jrunestone/nixos-config.git /etc/nixos/nixos-config`
4. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /etc/nixos/nixos-config/disko-config.nix --arg disk '"/dev/nvme0n1"' --arg pp '""'`
5. `mkdir -p {/mnt/nix/persist/system/passwords, /mnt/nix/persist/user}
6. `mv /etc/nixos/nixos-config /mnt/etc/nixos/`
5. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
9. `nixos-install --root /mnt --flake /mnt/etc/nixos/nixos-config/#jr-home`
10. `reboot`