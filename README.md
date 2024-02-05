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
3. `curl https://raw.githubusercontent.com/jrunestone/nixos-config/main/disko-config.nix -O /tmp/disko.nix`
4. `sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix -- arg disk '"/dev/nvme0n1"'`
5. `mkdir -p /mnt/persist/system && mkdir -p /mnt/persist/user`
5. `sudo nixos-generate-config --no-filesystems --root /mnt`
6. `git clone https://github.com/jrunestone/nixos-config.git /mnt/etc/nixos/nixos-config`
7. Copy hardware-info.nix to repo/host if new host
8. `sudo mkpasswd -m sha-512 "<password>" > /mnt/persist/system/passwords/jr`
9. `nixos-install --root /mnt --flake /mnt/etc/nixos/nixos-config/#jr-home`
10. `reboot`