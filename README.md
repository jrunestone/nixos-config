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
6. `git clone https://github.com/jrunestone/nixos-config.git`
5. `sudo su`
4. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /home/nixos/nixos-config/disko-config.nix --arg disk '"/dev/<disk>"'`
5. `mkdir -p {/mnt/etc/nixos,/mnt/nix/persist/system/passwords/jr,/mnt/nix/persist/user}`
6. `mv nixos-config /mnt/nix/persist`
5. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
9. `nixos-install --no-root-passwd --root /mnt --flake /mnt/nix/persist/nixos-config/#<host>`
10. `reboot`