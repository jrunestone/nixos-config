* sops
    * install nixos with minimal bootstrap flake, generate or copy over ssh keys, reboot and nix-rebuild the original config
    * ssh key

* Steam
* Hyprland
    * waybar
    * login screen
* docker/podman (dev-env)
* Vscode/neovim
* Protonpass pwa
* 1Pass (dev-env?)
* PWA (dev-envs?)
    * Outlook
    * Teams

### devshells
nix-direnv + flakes
* dotnet

## Install
User is hard-coded to "jr" in flake for all hosts.

1. Run installer iso
2. Exit installer into cmd
3. `git clone https://github.com/jrunestone/nixos-config.git`
4. `sudo su`
5. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /home/nixos/nixos-config/disko-config.nix --arg disk '"/dev/<disk>"'`
6. `mkdir -p {/mnt/nix/persist/system/etc/nixos,/mnt/nix/persist/system/passwords}`
7. `mv nixos-config /mnt/nix/persist/system/etc/nixos`
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
9. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
10. `nixos-install --no-root-passwd --root /mnt --flake /mnt/nix/persist/system/etc/nixos/nixos-config#<host>`
11. `reboot`
12. Copy over ssh keys (if using sops this needs to be done before step 3)
13. Configure Gradience

## Commands
`nix-rebuild [switch|boot] /nixos-config.#[hostname]`
`journalctl -u home-manager-jr.service`
`journalctl --identifier "hm-activate-$user" --since "$date"`
