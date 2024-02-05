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

## Install
User is hard-coded to "jr" in flake for all hosts.

1. Run installer iso
2. Exit installer into cmd
6. `git clone https://github.com/jrunestone/nixos-config.git`
5. `sudo su`
4. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /home/nixos/nixos-config/disko-config.nix --arg disk '"/dev/<disk>"'`
5. `mkdir -p {/mnt/etc/nixos,/mnt/nix/persist/system/passwords,/mnt/nix/persist/user}`
6. `mv nixos-config /mnt/nix/persist`
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
5. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
9. `nixos-install --no-root-passwd --root /mnt --flake /mnt/nix/persist/nixos-config/#<host>`
10. `reboot`